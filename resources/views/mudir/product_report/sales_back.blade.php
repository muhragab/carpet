@extends('mudir.layout')
@section('content')
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    تفاصيل التقرير
                </h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.$purchaseBack -->

        <div class="row">
            <div class="col-lg-12">
                {{ alert($errors) }}
                <div class="panel panel-default">
                    <div class="table-responsive">
                        <table id="example1" class="table table-bordered table-striped dt-responsive nowrap">
                            <thead>
                            <tr>
                                <th width="10%">#</th>
                                <th>اسم المورد</th>
                                <th>اسم المخزن</th>
                                <th>تاريخ الفاتوره</th>
                                <th> المنتج</th>
                                <th> العدد</th>
                                <th>رقم الاذن</th>
                                <th width="10%"></th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($salesBack as $sale)
                                <tr>
                                    <td>{{ $sale->id }}</td>
                                    <td>{{ $sale->sale->supplier->name }}</td>
                                    <td>{{ $sale->sale->store->name }}</td>
                                    <td>{{ $sale->purchase->date }}</td>
                                    <td>{{ $sale->product->full_name }}</td>
                                    <td>{{ $sale->number }}</td>
                                    <td>{{ (!empty($sale->permission_number)) ? $sale->permission_number : '-' }}</td>
                                    <td>
                                        <div class="btn-group btn-group-sm">
                                            <a href="{{ route('BackSales.show', $sale->sale->id) }}"
                                               class="btn btn-info">عرض</a>
                                        <!-- <a href="{{ route('purchase.edit',  $sale->sale->id) }}" class="btn btn-info">تحرير</a> -->
                                        </div>
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

    </div>
@stop


