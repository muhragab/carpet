
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
                                <th>المخزن</th>
                                <th>رصيد اول المده</th>
                                <th>مشتريات</th>
                                <th>مشتريات مرتجعه</th>
                                <th>مبيعات</th>
                                <th>مبيعات مرتجعه</th>
                                <th>اجمالي</th>
                            </tr>
                            </thead>
                            <tbody class="text-center">
                            @foreach($data as $storeData)
                                <tr>

                                    <td>{{ $storeData->name }}</td>
                                    <td>
                                        <a href="{{url('report/store/main/products/'. $storeData->id)}}">
                                            {{ $storeData->mainProduct }}
                                        </a>
                                    </td>
                                    <td>
                                        <a href="{{url('report/store/purchases/'. $storeData->id)}}">
                                            {{ $storeData->purchase }}
                                        </a>
                                    </td>
                                    <td>
                                        <a href="{{url('report/store/purchases/back/'. $storeData->id)}}">
                                            {{ $storeData->purchaseBack }}
                                        </a>
                                    </td>
                                    <td>
                                        <a href="{{url('report/store/sales/'. $storeData->id)}}">
                                            {{ $storeData->sale }}
                                        </a>
                                    </td>
                                    <td>
                                        <a href="{{url('report/store/sales/back/'. $storeData->id)}}">
                                            {{ $storeData->saleBack }}
                                        </a>
                                    </td>
                                    <td>
                                        @php
                                            $sum = array();
                                        $sum = $storeData->mainProduct + $storeData->purchase + $storeData->saleBack  -  $storeData->sale - $storeData->purchaseBack;
                                        $finalSum[]= $sum;
                                        @endphp
                                        {{$storeData->mainProduct + $storeData->purchase + $storeData->saleBack -   $storeData->sale - $storeData->purchaseBack}}
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

            <div class="col-md-9 text-center">
                الاجمالي
            </div>
            <div class="col-md-3 text-center">
                @if(isset($finalSum))
                    @php
                        echo array_sum($finalSum);
                    @endphp
                @endif
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