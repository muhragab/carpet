@extends('mudir.layout')
@section('content')
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">اضافة فاتوره مشتريات</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    {{ alert($errors) }}
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    انشاء فاتورة
                </div>
                <div id="app">
                    <purchase-component></purchase-component>
                </div>
                <!-- /.panel-body -->
            </div>

            <!-- <form action="{{ route('supplier.store') }}" method="post">
                @CSRF
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>اسم الورد</label>
                            <input class="form-control" name="name">
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-success">اضافة</button>
            </form> -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
</div>
@stop

@section('scripts')
<script src="{{asset('js/app.js')}}" ></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script>
// Vue.http.options.emulateJSON = true;

new Vue({
    el: '#vueApp',
    delimiters: ['${', '}'],
    data: {
        product: '',
        number: '',
        price: '',
        dataResults: []
    },
    methods: {
      submitEntry: function() {

          var dataAdd = {
            product: this.product,
            number: this.number,
            price: this.price,
          };

          this.dataResults.push(dataAdd);

          this.product = '';
          this.number = '';
          this.price = '';

      }
    }
});
</script> -->
@endsection
