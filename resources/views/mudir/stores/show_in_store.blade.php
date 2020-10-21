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
                <div class="panel-heading">الاصناف التي في هذا المحزن {{ Count($products) }}</div>
                <div class="panel-body">
                    <div class="col-lg-12">
                        <h1 class="page-header">

                            <a class="btn btn-primary" href="{{url('/stores')}}">المخازن</a>
                            <a class="btn btn-primary pull-left" href="{{url('/add/to/store/'.$store->id)}}">اضافة
                                جديد</a>
                        </h1>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="table-responsive">
                        <table id="example1" class="table table-bordered table-striped dt-responsive nowrap">
                            <thead>
                            <tr>
                                <th width="50%">رقم الاذن</th>
                                <th>التاريخ</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($products as $product)
                                <tr>
                                    <td>
                                        <a href="{{url('store/product/details/'.$product->storeNumber.'/'.$product->store_id)}}">
                                            <p>{{ $product->storeNumber }}</p>
                                        </a>

                                    </td>
                                    <td>
                                        {{$product->created_at}}
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
