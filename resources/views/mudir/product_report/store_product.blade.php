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
        <!-- /.$creditor -->
        <div class="row">
            <h4 style="text-align: center">رصيد اول المده</h4>
            <div class="col-lg-12">
                {{ alert($errors) }}
                <div class="panel panel-default">
                    <div class="table-responsive">
                        <table id="example1" class="table table-bordered table-striped dt-responsive nowrap">
                            <thead>
                            <tr>
                                <td>#</td>
                                <td>المخزن</td>
                                <td>اسم المنتج بالكامل</td>
                                <td>العدد</td>
                                <td>الترتيب</td>
                                <td>التاريخ</td>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($mainProducts as $mainProduct)
                                <tr>
                                    <td>{{ $mainProduct->id}}</td>
                                    <td>{{ $mainProduct->store->name }}</td>
                                    <td>{{ $mainProduct->product->full_name }}</td>
                                    <td>{{ $mainProduct->number }}</td>
                                    <td>{{ $mainProduct->storeNumber }}</td>
                                    <td>{{ \Carbon\Carbon::parse($mainProduct->created_at)->format('d/m/y') }}</td>
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

    </div>
@stop


