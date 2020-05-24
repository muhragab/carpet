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
                   {!! Form::model($salesMan, ['route' => ['salesMen.update', $salesMan->id], 'method' => 'patch']) !!}

                        @include('mudir.sales_men.fields')

                   {!! Form::close() !!}
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection