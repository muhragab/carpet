@extends('mudir.layout')
@section('content')
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-10">
                <h1 class="page-header">فاتورة المشتريات ({{ $purchase->id }})</h1>
            </div>
            <br>
            <div class="col-md-2">
                <button type="button" onclick="printDiv('printableArea')"
                        class="btn btn-success btn-lg btn-block">
                    طباعه    <span class="fa fa-print"></span>
                </button>
            </div>
            <!-- /.col-lg-12 -->
        </div>
    {{ alert($errors) }}
    <!-- /.row -->
        <div class="container">
            <div class="row" id="bill">
                <div class="col-md-1">
                    <!------ Include the above in your HEAD tag ---------->
                    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet"
                          id="bootstrap-css">
                    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
                    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
                </div>
                <div class="well col-md-10 ">
                    <div class="row">
                        <div class="col-xs-4">


                            <p><strong>اسم المورد:-</strong>
                                {{ $purchase->supplier->name }}</p>
                            <p><strong> الاجمالي: </strong>{{ $purchase->priceFinal }}</p>
                            <p><strong> السعر النهائي:- </strong>{{ $purchase->finalPrice }}</p>

                        </div>
                        <div class="col-md-4">

                        </div>
                        <div class="col-xs-4">
                            <p>
                                <em>التاريخ : {{  $purchase->date}}</em>
                            </p>
                            <p>
                                <em>رقم
                                    الاذن:-
                                    #: {{ (!empty($purchase->permission_number)) ? $purchase->permission_number : '-' }}</em>
                            </p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="text-center">
                            <h1>{{ $purchase->stores->name }}</h1>
                        </div>
                        </span>
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th class="text-center">المنتج</th>
                                <th class="text-center">العدد</th>
                                <th class="text-center">المتر المربع</th>
                                <th class="text-center">سعر القطعه الواحده</th>
                                <th class="text-center">اجمالي الامتار</th>
                                <th class="text-center">سعر م المربع</th>
                                <th class="text-center">الاجمالي</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>

                            @foreach($purchase->items as $item)
                                <tr>
                                    <td class="text-center">{{ $item->product->full_name }}</td>
                                    <td class="text-center">{{ $item->number }}</td>
                                    <td class="text-center">{{ ($item->product->sizes_length) * ($item->product->sizes_width)}}</td>
                                    <td class="text-center">{{($item->product->sizes_length) * ($item->product->sizes_width) * ($item->price) }}</td>
                                    <td class="text-center">{{ ($item->product->sizes_length) * ($item->product->sizes_width) * ($item->number)}}</td>
                                    <td class="text-center">{{ $item->price }}</td>
                                    <td class="text-center">{{ $item->total_price }}</td>
                                </tr>
                            @endforeach

                            </tbody>
                        </table>
                        <hr/>
                        <hr/>
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th class="text-center">نسبه الخصم</th>
                                <th class="text-center">الضرائب</th>
                                <th class="text-center">اجمالي عدد الامتار</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                            <tr>
                                <td class="text-center">{{ $purchase->discount }}</td>
                                <td class="text-center">{{ $purchase->taxes }}</td>
                                <td class="text-center">{{ $purchase->allMeters }}</td>
                            </tr>
                            <tr>
                                <th class="text-center">المحاسب</th>
                                <th class="text-center">رئيس الحسابات</th>
                                <th class="text-center">المدير المالي</th>
                            </tr>
                            <tr>
                                <td class="text-center">.........................</td>
                                <td class="text-center">.........................</td>
                                <td class="text-center">.........................</td>
                            </tr>

                            </tbody>
                        </table>
                        </td>
                    </div>
                </div>
                <!-- /.row -->

            </div>

        </div>
    </div>
@stop
