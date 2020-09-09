<template>
    <div class="panel-body" id="vueApp">
        <form @submit="formSubmit">
            <div class="col-md-12">
                <div class="panel panel-default">

                    <div class="panel-body">
                        <div class="row">

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>المخزن</label>
                                    <select class="form-control" v-model="inventorie_id" required>
                                        <option></option>
                                        <option v-for="store in stores" :key="store.id" :value="store.id">{{store.name
                                            }}
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>الموردين</label>
                                    <select class="form-control" v-model="supplier_id" required>
                                        <option></option>
                                        <option v-for="supplier in suppliers" :key="supplier.id" :value="supplier.id">{{
                                            supplier.name }}
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>رقم الاذن</label>
                                    <input disabled class="form-control" :value="permission"/>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>التاريخ</label>
                                    <input type="date" class="form-control" v-model="date" required/>
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
                                    <label>المنتجات</label>
                                    <select class="form-control" v-model="product_id" :change="getProduct()">
                                        <option></option>
                                        <option v-for="product in products" :key="product.id" :value="product.id">{{
                                            product.full_name }}
                                        </option>
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
                                    <a @click="submitEntry" class="btn btn-success"
                                       style="margin-top: 25px !important;">اضافة</a>
                                </div>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>المنتج</th>
                                    <th>العدد</th>
                                    <th>المتر المربع</th>
                                    <th>سعر القطعه الواحده</th>
                                    <th>اجمالي الامتار</th>
                                    <th>سعر م المربع</th>
                                    <th>الجمالي</th>
                                    <th width="9%"></th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="item in items" :key="item.product">
                                    <td>{{ item.product }}</td>
                                    <td>{{ item.number }}</td>
                                    <td>{{ item.sizes_length * item.sizes_width}}</td>
                                    <td>{{ item.sizes_length * item.sizes_width * item.price}}</td>
                                    <td>{{ item.sizes_length * item.sizes_width * item.number}}</td>
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
                            <div class="col-md-3">
                                <b>الاجمالي</b>
                                <input class="form-control" disabled type="text" v-model="outTotal"
                                       placeholder="اجمالي السعر ">
                            </div>
                            <div class="col-md-3">
                                <b>اجمالي الامتار</b>
                                <input class="form-control" disabled type="text" v-model="meters"
                                       placeholder="اجمالي السعر ">
                            </div>
                            <div class="col-md-3">
                                <b>ض . ق . م</b>
                                <input class="form-control" type="number" v-model="taxes" placeholder="قيمة الضرائب">
                                <p>{{ outTotal+(outTotal*taxes/100) }} ({{ taxes }}%)</p>
                            </div>
                            <div class="col-md-3">
                                <b>اجمالي السعر بعد الضريبه</b>
                                <b class="form-control" disabled=""> {{outTotal+(outTotal*taxes/100)}}</b>
                            </div>
                        </div>

                        <div class="row" style="text-align: center;">
                            <div class="col-md-4">
                                <b>خصم نسبه</b>
                                <input class="form-control" type="number" v-model="discount" placeholder="خصم بنسبه ">
                                <p>{{(outTotal+(outTotal*taxes/100)) * (discount/100)}} </p>
                            </div>
                            <div class="col-md-4">
                                <b>اجمالي السعر بعد خصم النسبه</b>
                                <b class="form-control" disabled="">{{(outTotal+(outTotal*taxes/100)) -
                                    ( (outTotal+(outTotal*taxes/100)) * (discount/100))}}</b>
                            </div>
                            <div class="col-md-4">
                                <b>تعديل السعر</b>
                                <input type="text" class="form-control" v-model="finalPrice">
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
    import {Component, Prop} from 'vue-property-decorator';
    import axios from 'axios';

    @Component
    export default class PurchaseComponent extends Vue {
        // @Prop({default: 'Example'})

        // axios: any;
        supplier_id: any = '';
        inventorie_id: any = '';
        permission_number: any = '';
        finalPrice: any = '';
        product_id: any = '';
        number: any = '';
        date: any = '';
        price: any = '';
        suppliers: any = [];
        products: any = [];
        stores: any = [];
        store: any = [];
        permission: any = [];
        product: any = [];
        items: any = [];

        outTotal: number = 0;
        meters: number = 0;
        taxes: number = 0;
        discount: number = 0;

        mounted() {
            console.log('Component mounted.');
            console.log(this.permission);

            axios.get('/api/supplier/all?type=supplier').then(response => (this.suppliers = response.data));
            axios.get('/api/back/permission/number').then(response => (this.permission = response.data));
            axios.get('/api/get-all-product').then(response => (this.products = response.data));
            axios.get('/api/get-all-stores').then(response => (this.stores = response.data));

            this.calcTotal();
            this.calcMeter();
        }


        submitEntry(): void {
            var dataAdd = {
                product: this.product.name + ' ' + this.product.sizes_length + '×' + this.product.sizes_width,
                product_id: this.product.id,
                number: this.number,
                sizes_length: this.product.sizes_length,
                sizes_width: this.product.sizes_width,
                price: this.price,
                cost: ((this.product.sizes_length * this.product.sizes_width) * this.price) * this.number,
            };


            this.items.push(dataAdd);

            this.product_id = '';
            this.number = '';
            this.price = '';

            this.calcTotal();
            this.calcMeter();

        }

        formSubmit(e) {
            e.preventDefault();
            let currentObj = this;
            axios.post('/api/back/purchase/save', {
                supplier_id: this.supplier_id,
                inventorie_id: this.inventorie_id,
                permission_number: this.permission,
                finalPrice: this.finalPrice,
                date: this.date,
                items: this.items,
                allPrice: this.outTotal,
                allMeters: this.meters,
                taxes: this.taxes,
                discount: this.discount
            })
                .then(function (response) {
                    console.info(response.data);
                    if (response.data == 'done') {
                        location.href = '/purchases/back';
                    }
                })
                .catch(function (error) {
                    // currentObj.output = error;
                });
        }

        getProduct() {
            if (this.product_id) {
                axios.get('/api/get/product/one?id=' + this.product_id).then(response => (this.product = response.data));
            }
        }

        itemRemove(doc) {
            console.log(doc);
            this.items.forEach((item, index) => {
                if (item === doc) this.items.splice(index, 1);
            });
            this.calcTotal();
            this.calcMeter();
        }

        calcTotal() {
            let outTotal = 0;
            this.items.forEach(item => {
                outTotal += item.cost;
            });
            this.outTotal = outTotal;
        }

        calcMeter() {
            let meters = 0;
            this.items.forEach(item => {
                meters += (item.sizes_length * item.sizes_width * item.number);
            });
            this.meters = meters;
        }
    }
</script>
