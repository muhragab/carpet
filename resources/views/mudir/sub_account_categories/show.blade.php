

@extends('mudir.layout')

@section('content')
    <div id="page-wrapper">

        <section class="content-header">
            <h1>
                Account Category
            </h1>
        </section>
        <div class="content">
            <div class="box box-primary">
                <div class="box-body">
                    <div class="row" style="padding-left: 20px">
                        @include('mudir.sub_account_categories.show_fields')
                        <a href="{{ route('accountCategories.index') }}" class="btn btn-default">Back</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
