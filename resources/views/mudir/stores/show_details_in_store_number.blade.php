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
                                <th>رقم الاذن</th>
                                <th>الاسم</th>
                                <th>العدد</th>
                                <th>المتر المربع</th>
                                <th>السعر</th>
                                <th>التاريخ</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($products as $product)

                                <tr>
                                    <td>
                                        {{ $product->storeNumber }}
                                    </td>
                                    <td>
                                        <p>{{ $product->product->full_name }}</p>
                                    </td>
                                    <td>{{ $product->numbers }}</td>
                                    <td>{{ $product->product->sizes_length*$product->product->sizes_width }}
                                        ({{ $product->product->sizes_length*$product->product->sizes_width*$product->number }}
                                        )
                                    </td>
                                    <td>{{ $product->product->price_meter }}
                                        ({{ $product->product->price_meter*$product->number }})
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
