@extends('mudir.layout')

@section('content')
    <div id="page-wrapper">
        <section class="content-header">
            <h1>
                Account Category
            </h1>
        </section>
        <div class="content">
            @include('adminlte-templates::common.errors')
            <div class="box box-primary">
                <div class="box-body">
                    <div class="row">
                        {!! Form::model($subAccountCategory, ['route' => ['subAccountCategories.update', $subAccountCategory->id], 'method' => 'patch']) !!}

                        @include('mudir.sub_account_categories.fields')

                        {!! Form::close() !!}
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

