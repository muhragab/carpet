@extends('mudir.layout')

@section('content')
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    الاصناف
                    <a class="btn btn-primary pull-left" href="{{ route('products.create') }}">اضافة جديد</a>
                </h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                {{ alert($errors) }}
                <div class="panel panel-default">
                    <div class="table-responsive">
                        <table id="example1" class="table table-bordered table-striped dt-responsive nowrap">
                            <thead>
                            <tr>
                                <th width="10%">#</th>
                                <th>اسم</th>
                                <th width="30%"></th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($products as $product)
                                <tr>
                                    <td>{{ $product->id }}</td>
                                    <td>{{ $product->full_name }}</td>
                                    <td>
                                        <div class="btn-group btn-group-sm">

                                            <form action="{{ route('products.destroy', [$product]) }}" method="POST">
                                                @csrf
                                                @method('DELETE')

                                                <div class="btn-group btn-group-sm">
                                                    <a href="{{ route('products.edit', [$product]) }}"
                                                       class="btn btn-success">
                                                        <span class="fa fa-fw fa-edit"></span>
                                                        تحرير
                                                    </a>

                                                </div>
                                                <div class="btn-group btn-group-sm">

                                                    <button type="submit" class="btn btn-danger"
                                                            onclick="return confirm('Are you sure you want to delete it?')">
                                                        <span class="fa fa-fw fa-trash"></span>
                                                        حذف
                                                    </button>
                                                </div>
                                            </form>
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
        <!-- /.row -->
    </div>
@endsection
