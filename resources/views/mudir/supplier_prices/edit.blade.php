@extends('mudir.layout')

@section('content')
    <div id="page-wrapper">
        <section class="content-header">
            <h1>
                تسعير عميل
            </h1>
        </section>
        <div class="content">
            @include('adminlte-templates::common.errors')
            <div class="box box-primary">
                <div class="box-body">
                    <div class="row">
                        {!! Form::model($supplierPrice, ['route' => ['supplierPrices.update', $supplierPrice->id], 'method' => 'patch']) !!}

                        @include('mudir.supplier_prices.fields')

                        {!! Form::close() !!}
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

