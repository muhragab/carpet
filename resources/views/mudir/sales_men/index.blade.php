@extends('mudir.layout')

@section('content')
    <div id="page-wrapper">
        <div class="row">
            <h1 class="pull-right">Account Categories</h1>
            <h1 class="pull-left">
                <a class="btn btn-primary pull-right" style="margin-top: -10px;margin-bottom: 5px"
                   href="{{ route('salesMen.create') }}">Add New</a>
            </h1>
            <!-- /.col-lg-12 -->
        </div>

        <!-- /.row -->
        <div class="row">
            @include('flash::message')

            {{--  @include('mudir.account_categories.table')--}}

            <div class="row">
                <div class="col-lg-12">
                    {{ alert($errors) }}
                    <div class="panel panel-default">
                        <div class="table-responsive">
                            <table id="example1" class="table table-bordered table-striped dt-responsive nowrap">
                         <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Address</th>
                                    <th>Phonenumber</th>
                                    <th>Phone</th>
                                    <th>Faxnum</th>
                                    <th>Email</th>
                                    <th colspan="3">Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($salesMen as $salesMan)
                                    <tr>
                                        <td>{{ $salesMan->name }}</td>
                                        <td>{{ $salesMan->address }}</td>
                                        <td>{{ $salesMan->phoneNumber }}</td>
                                        <td>{{ $salesMan->phone }}</td>
                                        <td>{{ $salesMan->faxNum }}</td>
                                        <td>{{ $salesMan->email }}</td>
                                        <td>
                                            {!! Form::open(['route' => ['salesMen.destroy', $salesMan->id], 'method' => 'delete']) !!}
                                            <div class='btn-group'>
                                                <a href="{{ route('salesMen.show', [$salesMan->id]) }}" class='btn btn-default btn-xs'><i class="fa fa-eye"></i></a>
                                                <a href="{{ route('salesMen.edit', [$salesMan->id]) }}" class='btn btn-default btn-xs'><i class="fa fa-edit"></i></a>
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

