@extends('mudir.layout')
@section('content')
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">عرض بيانات مخزن "{{ $store->name }}"</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>

    {{ alert($errors) }}
    <!-- /.row -->
        <div class="row">


            <div class="panel panel-default">
                <div class="panel-heading">{{--الاصناف التي في هذا المحزن {{ Count($products) }}--}}</div>
                <div class="panel-body">
                    <div class="col-lg-12">
                        <h1 class="page-header">

                            <a class="btn btn-primary" href="{{url('/stores')}}">المخازن</a>
                            <a class="btn btn-primary pull-left" href="{{url('/stores/'.$store->id)}}">تحويل جديد</a>
                        </h1>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="table-responsive">
                        <table id="example1" class="table table-bordered table-striped dt-responsive nowrap">
                            <thead>
                            <tr>
                                <th>رقم التسلسل</th>
                                <th>العدد</th>
                                <th>الاسم المخزن</th>
                                <th> اسم المنتج</th>
                                {{--<th>التسلسل</th>--}}
                                <th>التاريخ</th>
                                <th>المتر المربع</th>
                                <th>اجمالي الامتار</th>
                                <th>السعر</th>
                                <!-- <th width="20%">تعديل</th> -->
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($logs as $log)
                                <tr>
                                    <td>#{{ $log->orderNumber }}</td>
                                    <td>{{ $log->number }}</td>
                                    <td>{{ $log->store_from->name }}</td>
                                    <td>{{ $log->product->name }}</td>
                                    <td>{{ $log->transfer_date }}</td>
                                    <td>{{ $log->product->sizes_length*$log->product->sizes_width }}</td>
                                    <td>{{ $log->product->sizes_length*$log->product->sizes_width*$log->number }}</td>
                                    <td>{{ $log->product->price_meter }}
                                        ({{ $log->product->price_meter*$log->number }})
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
        </div>

    </div>
    <!-- /.row -->
    </div>
@stop
