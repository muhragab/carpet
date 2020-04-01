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
                {{-- <form action="{{ route('stores_product.store') }}" method="POST" enctype="multipart/form-data">
                     @CSRF
                     <input type="hidden" name="store_id" value="{{ $store->id }}">
                     <div class="row">
                         <div class="col-md-8">
                             <div class="form-group">
                                 <label>الصنف</label>
                                 <select class="form-control" name="product_id">
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
                                 <input class="form-control" type="number" name="number" min="0" value="">
                             </div>
                         </div>
                         <div class="col-md-12">
                             <div class="form-group">
                                 <button type="submit" class="btn btn-success">اضافة</button>
                             </div>
                         </div>
                     </div>
                 </form>--}}
                <div class="panel panel-default">
                    <div class="table-responsive">
                        <table id="example1" class="table table-bordered table-striped dt-responsive nowrap">
                            <thead>
                            <tr>
                                <th width="50%">الاسم</th>
                                <th>المتر المربع</th>
                                <th>السعر</th>
                                <th>العدد</th>
                                <th>الحاله</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($store->logs_transfer_to as $log)
                                <tr>
                                    <td>
                                        <p><b>التحويل من</b> {{ $log->store_from->name }}</p>
                                        <p>{{ $log->product->full_name }}</p>
                                        <p>
                                            <b>التاريخ</b> {{ $log->transfer_date ?? $log->created_at->format('Y-m-d')}}
                                        </p>
                                    </td>
                                    <td>{{ $log->product->sizes_length*$log->product->sizes_width }}
                                        ({{ $log->product->sizes_length*$log->product->sizes_width*$log->number }}
                                        )
                                    </td>
                                    <td>{{ $log->product->price_meter }}
                                        ({{ $log->product->price_meter*$log->number }})
                                    </td>
                                    <td>{{ $log->number }}</td>
                                    <td>
                                        @if($log->acceptance == 'pending') قيد الانتظار @endif
                                        @if($log->acceptance == 'yes') مقبول @endif
                                        @if($log->acceptance == 'no') مرفوض @endif
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
