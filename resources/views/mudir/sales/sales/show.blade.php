@extends('mudir.layout')
@section('content')
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">فاتورة المبيعات ({{ $sale->id }})</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    {{ alert($errors) }}
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">

            <div>
                <b>اسم المورد:-</b>
                <p>{{ $sale->supplier->name }}</p>
            </div>

            <div>
                <b>رقم الاذن:-</b>
                <p>{{ (!empty($sale->permission_number)) ? $sale->permission_number : '-' }}</p>
            </div>

            <div>
                <b>الاجمالي:-</b>
                <p>{{ $sale->price }}</p>
            </div>

            <div>
                <b>الضرائب:-</b>
                <p>{{ $sale->taxes }}</p>
            </div>

            <div>
                <b>جدول المشريات:-</b>
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover">
                        <thead>
                            <tr>
                                <th width="35%">المنتج</th>
                                <th>العدد</th>
                                <th>سعر المتر المربع</th>
                                <th>الجمالي</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($sale->items as $item)
                            <tr>
                                <td>{{ $item->product->full_name }}</td>
                                <td>{{ $item->number }}</td>
                                <td>{{ $item->price }}</td>
                                <td class="kt-font-danger kt-font-lg">{{ $item->total_price }}</td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
</div>
@stop
