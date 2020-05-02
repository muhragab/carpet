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
                <div class="panel-heading">التحويل</div>
                <div class="panel-body">
                    <form action="{{ route('stores.transformation') }}" method="POST" enctype="multipart/form-data">
                        @CSRF
                        <input type="hidden" name="store_from" value="{{ $store->id }}">
                        <div class="row">
                            <div class="form-block">
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <label>الي مخزن</label>
                                        <select class="form-control" name="store_to">
                                            <option value=>اختار المخزن</option>
                                            @foreach($stores as $_store)
                                                @if($store->id != $_store->id)
                                                    <option value="{{ $_store->id }}">{{ $_store->name }}</option>
                                                @endif
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>التاريخ</label>
                                        <input class="form-control" type="date" name="transfer_date">
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <label>الصنف</label>
                                        <select class="form-control" name="row[0][product_id]">
                                            <option value=>اختيار الصنف</option>
                                            @foreach($store->products as $product)
                                                <option
                                                        value="{{ $product->id }}">{{ $product->product->full_name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>العدد</label>
                                        <input class="form-control" type="number" name="row[0][number]" min="0"
                                               value="">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <button type="submit" class="btn btn-success  form-control">التحويل</button>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <a class="btn btn-primary add-more-btn form-control">المزيد</a>
                                </div>
                            </div>
                        </div>
                        <style>
                            .more {
                                margin-top: -15px;
                            }
                        </style>
                        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
                                type="text/javascript"></script>
                        <script>
                            var i = 2;

                            $(".add-more-btn").click(function () {
                                $(".form-block").append('<div class="col-md-8 more">\n' +
                                    '                                    <div class="form-group ">\n' +
                                    '                                        <select class="form-control" name="row[' + i + '][product_id]">\n' +
                                    '                                            <option value=>اختيار الصنف</option>\n' +
                                    '                                            @foreach($store->products as $product)\n' +
                                    '                                                <option\n' +
                                    '                                                        value="{{ $product->id }}">{{ $product->product->full_name }}</option>\n' +
                                    '                                            @endforeach\n' +
                                    '                                        </select>\n' +
                                    '                                    </div>\n' +
                                    '                                </div>\n' +
                                    '                                <div class="col-md-4 more ">\n' +
                                    '                                    <div class="form-group">\n' +
                                    '                                        <input class="form-control" type="number" name="row[' + i + '][number]" min="0" value="">\n' +
                                    '                                    </div>\n' +
                                    '                                </div>');
                                i++;
                            })
                        </script>
                    </form>
                </div>
                <!-- /.panel-body -->
            </div>
            <div class="row container text-center">
                <div class="col-md-6">
                    <a href="{{url('/show/store/send/'.$store->id)}}" class="btn btn-primary">التحويلات مني</a>
                </div>
                <div class="col-md-6">
                    <a href="{{url('/show/to/send/'.$store->id)}}" class="btn btn-primary">التحويلات الي</a>
                </div>
            </div>

        </div>

        <!-- /.row -->
    </div>
@stop
