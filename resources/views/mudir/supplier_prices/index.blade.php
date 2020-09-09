@extends('mudir.layout')

@section('content')
    <div id="page-wrapper">
        <div class="row">
            <h1 class="pull-left">تسعير العيمل</h1>
            <h1 class="pull-right">
                <a class="btn btn-primary pull-right" style="margin-top: -10px;margin-bottom: 5px"
                   href="{{ route('supplierPrices.create') }}">Add New</a>
            </h1>
            <!-- /.col-lg-12 -->
        </div>

        <!-- /.row -->
        <div class="row">
            @include('flash::message')
            <div class="row">
                <div class="col-lg-12">
                    {{ alert($errors) }}
                    <div class="panel panel-default">

                        <div class="table-responsive">
                            <table class="table" id="supplierPrices-table">
                                <thead>
                                <tr>
                                    <th>Supplier Id</th>
                                    <th>Product Id</th>
                                    <th>Price</th>
                                    <th colspan="3">Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($supplierPrices as $supplierPrice)
                                    <tr>
                                        <td>{{ $supplierPrice->supplier->name }}</td>
                                        <td>{{ $supplierPrice->product->name }}</td>
                                        <td>{{ $supplierPrice->price }}</td>

                                        <td>
                                            {!! Form::open(['route' => ['supplierPrices.destroy', $supplierPrice->id], 'method' => 'delete']) !!}
                                            <div class='btn-group'>
                                                <a href="{{ route('supplierPrices.edit', [$supplierPrice->id]) }}"
                                                   class='btn btn-default btn-xs'><i class="fa fa-edit"></i></a>

                                                {!! Form::button('<span class="fa fa-fw fa-trash"></span>', ['type' => 'submit', 'class' => 'btn btn-danger btn-xs', 'onclick' => "return confirm('Are you sure?')"]) !!}
                                            </div>
                                            {!! Form::close() !!}
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

        <!-- /.table-responsive -->
        <!-- /.panel -->
        <!-- /.col-lg-12 -->
        <!-- /.row -->

    </div>
@endsection


