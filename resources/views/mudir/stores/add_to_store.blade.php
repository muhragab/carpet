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
                <div class="panel-heading">الاصناف التي في هذا المحزن {{ $store->products->count() }}</div>
                <div class="panel-body">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            <a class="btn btn-primary" href="{{url('/stores')}}">المخازن</a>
                            <a class="btn btn-primary pull-left" href="{{url('/show/in/store/'.$store->id)}}">
                                عرض الاصناف</a>
                        </h1>
                    </div>
                </div>


                <form action="{{ route('stores_product.store') }}" method="POST"
                      enctype="multipart/form-data">
                    @CSRF
                    <div class=" form-main">

                        <div class="row form-block">
                            <input type="hidden" name="rows[0][store_id]" value="{{ $store->id }}">
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label>الصنف</label>
                                    <select class="form-control" name="rows[0][product_id]">
                                        <option value=>اختيار الصنف</option>
                                        @foreach($products as $product)
                                            <option value="{{ $product->id }}">{{ $product->full_name }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>العدد</label>
                                    <input class="form-control" type="number" name="rows[0][number]" min="0"
                                           value="">
                                </div>
                            </div>
                        </div>
                        <div id="mydiv"></div>

                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <button type="submit" class="btn btn-success">اضافة</button>
                        </div>
                    </div>
                    <a class="btn btn-primary add-more-btn">المزيد</a>
                    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
                            type="text/javascript"></script>

                    <script>
                        var i = 2;

                        $('.add-more-btn').click(function () {
                            $('.form-block').append('<input type="hidden" name="rows[' + i + '][store_id]" value="{{ $store->id }}">' + '<div class="col-md-8"><div class="form-group">' + '<label>الصنف</label>' +
                                '<select class="form-control" name="rows[' + i + '][product_id]">' +
                                '<option value=>اختيار الصنف</option>' +
                                '@foreach($products as $product)' +
                                '<option value="{{ $product->id }}">{{ $product->full_name }}</option>' + '@endforeach' +
                                '</select>' + '</div> </div> <div class="col-md-4"> <div class="form-group"> <label>العدد</label><input class="form-control" type="number" name="rows[' + i + '][number]" min="0"value=""> </div> </div> </div>');
                            i++;
                        })
                    </script>
                </form>

                <!-- /.panel -->

            </div>
        </div>

    </div>
    <!-- /.row -->
    </div>
@stop
