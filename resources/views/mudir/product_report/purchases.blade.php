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
        <!-- /.$purchase -->
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
                            @foreach($purchases as $purchase)
                                <tr>
                                    <td>{{ $purchase->id }}</td>
                                    <td>{{ $purchase->purchase->supplier->name }}</td>
                                    <td>{{ $purchase->purchase->store->name }}</td>
                                    <td>{{ $purchase->purchase->date }}</td>
                                    <td>{{ $purchase->product->full_name }}</td>
                                    <td>{{ $purchase->number }}</td>
                                    <td>{{ (!empty($purchase->permission_number)) ? $purchase->permission_number : '-' }}</td>
                                    <td>
                                        <div class="btn-group btn-group-sm">
                                            <a href="{{ route('purchase.show', $purchase->purchase->id) }}"
                                               class="btn btn-info">عرض</a>
                                        <!-- <a href="{{ route('purchase.edit', $purchase) }}" class="btn btn-info">تحرير</a> -->
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


