<template>
    <div class="panel-body" id="vueApp">       
        <form @submit="formSubmit">
            <div class="col-md-12">
                <div class="panel panel-default">
                    
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>العملاء</label>
                                <select class="form-control" v-model="supplier_id">
                                    <option></option>
                                    <option v-for="supplier in suppliers" :key="supplier.id" :value="supplier.id">{{ supplier.name }}</option>                                    
                                </select>
                            </div>
                        </div>

                    </div>
                    <div class="row">

                        <div class="col-md-4">
                            <div class="form-group">
                                <label>المخزن</label>
                                <select class="form-control" v-model="inventorie_id">
                                    <option value="1">السيوف</option>
                                    <option value="2">جمال عبد الناصر</option>
                                </select>
                            </div>
                        </div>

                    </div>
                    <div class="row">

                        <div class="col-md-4">
                            <div class="form-group">
                                <label>رقم الاذن</label>
                                <input class="form-control" v-model="permission_number"/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="panel-heading">الاصناف</div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="row">

                        <div class="col-md-4">
                            <div class="form-group">
                                <label>المنتاجات</label>
                                <select class="form-control" v-model="product_id" :change="getProduct()">
                                    <option></option>
                                    <option v-for="product in products" :key="product.id" :value="product.id">{{ product.full_name }}</option>                                    
                                </select>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="form-group">
                                <label>العدد</label>
                                <input class="form-control" placeholder="0000" v-model="number">
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="form-group">
                                <label>السعر</label>
                                <input class="form-control" placeholder="0000" v-model="price">
                            </div>
                        </div>

                        <div class="col-md-2">
                            <div class="form-group">
                                <a @click="submitEntry" class="btn btn-success" style="margin-top: 25px !important;">اضافة</a>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>المنتج</th>
                                        <th>العدد</th>
                                        <th>سعر المتر المربع</th>
                                        <th>الجمالي</th>
                                        <th width="9%"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="item in items" :key="item.product">
                                        <td>{{ item.product }}</td>
                                        <td>{{ item.number }}</td>
                                        <td>{{ item.price }}</td>
                                        <td class="kt-font-danger kt-font-lg">{{ item.cost }}</td>
                                        <td>
                                            <a class="btn btn-danger btn-xs" @click="itemRemove(item)">حذف</a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.table-responsive -->
                        <div class="row" style="text-align: center;">
                            <div class="col-md-6">
                                <b>الاجمالي</b>
                                <p>{{ outTotal }}</p>
                            </div>
                            <div class="col-md-6">
                                <input class="form-control" type="number" v-model="taxes" placeholder="قيمة الضرائب">
                                <p>{{ outTotal+(outTotal*taxes/100) }} ({{ taxes }}%)</p>
                            </div>
                        </div>
                    </div>
                    <!-- /.panel-body -->
                </div>
            </div>

            <div class="col-md-12">
                <button type="submit" class="btn btn-success">اضافة الفاتورة</button>
            </div>
        </form>
    </div>
</template>

<script lang="ts">
    import Vue from 'vue';
    import { Component, Prop } from 'vue-property-decorator';
    import axios from 'axios';

    @Component
    export default class SalesComponent extends Vue {
        // @Prop({default: 'Example'})

        // axios: any;
        supplier_id: any = '';
        inventorie_id: any = '';
        permission_number: any = '';
        product_id: any = '';
        number: any = '';
        price: any = '';
        suppliers: any = [];
        products: any = [];
        product: any = [];
        items: any = [];

        outTotal: number;
        taxes: number = 0;

        mounted() {
            console.log('Component mounted.');

            axios.get('/api/supplier/all?type=client').then(response => (this.suppliers = response.data));

            axios.get('/api/get-all-product').then(response => (this.products = response.data));

            this.calcTotal();
        }
        
        // data () {
        //     return {
        //         supplier_id: '',
        //         inventorie_id: '',
        //         product_id: '',
        //         number: '',
        //         price: '',
        //         suppliers: [],
        //         products: [],
        //         product: null,
        //         items: []
        //     }
        // }

        submitEntry(): void {
            var dataAdd = {
                product: this.product.name+' '+this.product.sizes_length+'×'+this.product.sizes_width,
                product_id: this.product.id,
                number: this.number,
                price: this.price,
                cost: ((this.product.sizes_length*this.product.sizes_width)*this.price)*this.number,
            };

            this.items.push(dataAdd);

            this.product_id = '';
            this.number = '';
            this.price = '';

            this.calcTotal();

        }

        formSubmit(e) {
            e.preventDefault();
            let currentObj = this;
            axios.post('/api/sale/save', {
                supplier_id: this.supplier_id,
                inventorie_id: this.inventorie_id,
                permission_number: this.permission_number,
                items: this.items,
                taxes: this.taxes
            })
            .then(function (response) {
                console.info(response.data);
                if (response.data == 'done') {
                    location.href = '/sales/sales';
                }
            })
            .catch(function (error) {
                // currentObj.output = error;
            });
        }

        getProduct()
        {
            if (this.product_id) {
                axios.get('/api/get/product/one?id='+this.product_id).then(response => (this.product = response.data));
            }
        }

        itemRemove(doc)
        {
            console.log(doc);
            this.items.forEach( (item, index) => {
                if(item === doc) this.items.splice(index,1);
            });
            this.calcTotal();
        }

        calcTotal()
        {
            let outTotal = 0;
            this.items.forEach(item => {
                outTotal += item.cost;
            });
            this.outTotal = outTotal;
        }
    }
</script>
