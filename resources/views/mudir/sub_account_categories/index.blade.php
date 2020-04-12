@extends('mudir.layout')

@section('content')
    <div id="page-wrapper">
        <div class="row">
            <h1 class="pull-left">Sub Account Categories</h1>
            <h1 class="pull-right">
                <a class="btn btn-primary pull-right" style="margin-top: -10px;margin-bottom: 5px"
                   href="{{ route('subAccountCategories.create') }}">Add New</a>
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
                                    <th width="5%">Category_id</th>
                                    <th width="10%">الاسم</th>
                                    <th width="10%">#</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($subAccountCategories as $subAccountCategory)
                                    <tr>
                                        <td>{{ $subAccountCategory->category->title }}</td>
                                        <td>{{ $subAccountCategory->title }}</td>
                                        <td>{{ $subAccountCategory->number }}</td>
                                        <td>
                                            {!! Form::open(['route' => ['subAccountCategories.destroy', $subAccountCategory->id], 'method' => 'delete']) !!}
                                            <div class='btn-group'>
                                                <a href="{{ route('subAccountCategories.show', [$subAccountCategory->id]) }}"
                                                   class='btn btn-default btn-xs'><i class="fa fa-eye"></i></a>

                                                <a href="{{ route('subAccountCategories.edit', [$subAccountCategory->id]) }}"
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

