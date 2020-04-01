@extends('mudir.layout')

@section('content')
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    الالوان
                    <a class="btn btn-primary pull-left" href="{{ route('colors.create') }}">اضافة جديد</a>
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
                                <th width="10%"></th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($colors as $color)
                                <tr>
                                    <td>{{ $color->id }}</td>
                                    <td>{{ $color->name }}</td>
                                    <td>
                                        <div class="btn-group btn-group-sm">

                                            <form action="{{ route('colors.destroy', [$color]) }}" method="POST">
                                                @csrf
                                                @method('DELETE')

                                                <div class="btn-group btn-group-sm">
                                                    <a href="{{ route('colors.edit', [$color]) }}"
                                                       class="btn btn-success">
                                                        <span class="fa fa-fw fa-edit"></span>
                                                        تحرير
                                                    </a>

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
