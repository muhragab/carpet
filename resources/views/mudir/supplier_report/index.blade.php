@extends('mudir.layout')
@section('content')
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    تقرير
                </h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                {{ alert($errors) }}
                <div class="panel panel-default">
                    <div class="table-responsive">
                        <table id="example1" class="table table-bordered table-striped dt-responsive nowrap">
                            <thead>
                            <tr>
                                <th>الاسم</th>
                                <th>رقم الجوال</th>
                                <th>المقبوضات</th>
                                <th>المصروفات</th>
                                <th>مشتريات</th>
                                <th>مشتريات مرتجعه</th>
                                <th>مبيعات</th>
                                <th>مبيعات مرتجعه</th>
                                <th>اجمالي</th>
                            </tr>
                            </thead>
                            <tbody class="text-center">
                            @foreach($data as $supplierData)
                                <tr>

                                    <td>{{ $supplierData->name }}</td>
                                    <td>{{ $supplierData->phone_number }}</td>
                                    <td>
                                        <a href="{{url('report/supplier/creditors/'. $supplierData->id)}}">
                                            {{ $supplierData->creditor }}
                                        </a>
                                    </td>
                                    <td>
                                        <a href="{{url('report/supplier/debtor/'. $supplierData->id)}}">{{ $supplierData->debtor }}</a>
                                    </td>
                                    <td>
                                        <a href="{{url('report/supplier/purchases/'. $supplierData->id)}}">
                                            {{ $supplierData->purchase }}
                                        </a>
                                    </td>
                                    <td>
                                        <a href="{{url('report/supplier/purchases/back/'. $supplierData->id)}}">
                                            {{ $supplierData->purchaseBack }}
                                        </a>
                                    </td>
                                    <td>
                                        <a href="{{url('report/supplier/sales/'. $supplierData->id)}}">{{ $supplierData->sale }}</a>
                                    </td>
                                    <td>
                                        <a href="{{url('report/supplier/sales/back/'. $supplierData->id)}}">{{ $supplierData->saleBack }}</a>
                                    </td>
                                    <td>
                                        @php
                                            $sum = array();
                                        $sum = $supplierData->creditor + $supplierData->purchase + $supplierData->saleBack - $supplierData->debtor -  $supplierData->sale - $supplierData->purchaseBack;
                                        $finalSum[]= $sum;
                                        @endphp
                                        {{$supplierData->creditor + $supplierData->purchase + $supplierData->saleBack - $supplierData->debtor -  $supplierData->sale - $supplierData->purchaseBack}}
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>

                    </div>
                    <!-- /.table-responsive -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->

        <div class="row text-center" style="height:50px; background: #1b1e21; padding: 10px ; color: #f3f3f3">

            <div class="col-md-9 text-center" >
                الاجمالي
            </div>
            <div class="col-md-3 text-center">
                @php
                    echo array_sum($finalSum);
                @endphp

            </div>
        </div>
    </div>
@stop

@section('scripts')
    <script>
        function confirmDestroy(category_id, category_name) {
            var check = confirm(`هل انت متاكد من حذف "${category_name}" ؟`);
            if (check === true) {
                event.preventDefault();
                document.getElementById('destroy-form-' + category_id).submit();
                return true;
            } else {
                event.preventDefault();
                return false;
            }
        }
    </script>
@endsection
