<!-- Category Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('category_id', 'Category Id:') !!}
    @if (empty($subAccountCategory))
        {!! Form::select('category_id',$countries,  null, ['class' => 'form-control']) !!}
    @else
        {!! Form::select('category_id',$countries,  $subAccountCategory->id, ['class' => 'form-control']) !!}
    @endif
</div>

<!-- Title Field -->
<div class="form-group col-sm-6">
    {!! Form::label('title', 'Title:') !!}
    {!! Form::text('title', null, ['class' => 'form-control']) !!}
</div>

<!-- Submit Field -->
<div class="form-group col-sm-12">
    {!! Form::submit('Save', ['class' => 'btn btn-primary']) !!}
    <a href="{{ route('subAccountCategories.index') }}" class="btn btn-default">Cancel</a>
</div>
