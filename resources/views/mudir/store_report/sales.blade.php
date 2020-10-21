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
                                <th>اسم المخزن</th>
                                <th>رقم الاذن</th>
                                <th>نسبه الخصم</th>
                                <th>السعر</th>
                                <th>السعر النهائي</th>
                                <th>السعر النهائي بعد الخصم</th>
                                <th>اجمالي الامتار </th>
                                <th>الضريبه </th>
                                <th>التاريخ</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($sales as $sale)
                                <tr>
                                    <td>{{ $sale->stores->name }}</td>
                                    <td>{{ $sale->permission_number }}</td>
                                    <td>{{ $sale->discount }}</td>
                                    <td>{{ $sale->price }}</td>
                                    <td>{{ $sale->finalPrice }}</td>
                                    <td>{{ $sale->priceFinal }}</td>
                                    <td>{{ $sale->allMeters }}</td>
                                    <td>{{ $sale->taxes }}</td>
                                    <td>{{ $sale->date }}</td>
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


