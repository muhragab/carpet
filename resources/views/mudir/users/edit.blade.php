@extends('mudir.layout')
@section('content')
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">حساب "{{ $user->name }}"</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    {{ alert($errors) }}
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <form action="{{ route('user.update', [$user]) }}" method="post">
                @CSRF
                @method('PUT')
                <div class="row">
                    <div class="col-md-6">

                        <div class="form-group">
                            <label>الاسم</label>
                            <input class="form-control" name="name" value="{{ $user->name }}" disabled>
                        </div>

                        <div class="form-group">
                            <label>البريد الالكتروني</label>
                            <input class="form-control" name="writer_name" value="{{ $user->email }}" disabled>
                        </div>

                        <!-- <div class="form-group">
                            <label>نوع الحساب</label>
                            <select class="form-control" name="role">
                                <option value="general_manage" @if($user->role == 'general_manage') selected @endif>مدير عام</option>
                                <option value="editor" @if($user->role == 'editor') selected @endif>محرر</option>
                                <option value="writer" @if($user->role == 'writer') selected @endif>كاتب</option>
                                <option value="user" @if($user->role == 'user') selected @endif>مستخدم</option>
                            </select>
                        </div> -->

                    </div>
                </div>
                <button type="submit" class="btn btn-success">تحديث</button>
            </form>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
</div>
@stop
