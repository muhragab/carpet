@extends('mudir.layout')

@section('content')
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">اضافة تصنيف جديد</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    {{ alert($errors) }}
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <form action="{{ route('categories.store') }}" method="post">
                @CSRF
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>مجموعة البيع</label>
                            <select class="form-control" name="category_id">
                                <option value=>اختيار اساسي</option>
                                @foreach($categories as $category)
                                <option value="{{ $category->id }}">{{ $category->name }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>اسم التصنيف</label>
                            <input class="form-control" name="name">
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-success">اضافة</button>
            </form>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
</div>
@endsection
