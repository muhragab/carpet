<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateSubAccountCategoryRequest;
use App\Http\Requests\UpdateSubAccountCategoryRequest;
use App\Models\AccountCategory;
use App\Models\SubAccountCategory;
use App\Repositories\SubAccountCategoryRepository;
use Illuminate\Http\Request;
use Flash;
use Response;

class SubAccountCategoryController extends AppBaseController
{
    /** @var  SubAccountCategoryRepository */
    private $subAccountCategoryRepository;

    public function __construct(SubAccountCategoryRepository $subAccountCategoryRepo)
    {
        $this->subAccountCategoryRepository = $subAccountCategoryRepo;
    }

    /**
     * Display a listing of the SubAccountCategory.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function index(Request $request)
    {
        $subAccountCategories = SubAccountCategory::with('category')->get();
        return view('mudir.sub_account_categories.index')
            ->with('subAccountCategories', $subAccountCategories);
    }

    /**
     * Show the form for creating a new SubAccountCategory.
     *
     * @return Response
     */
    public function create()
    {
        $countries = AccountCategory::all()->sortBy('title', SORT_NATURAL | SORT_FLAG_CASE)->pluck('title', 'id');

        return view('mudir.sub_account_categories.create')->with('countries', $countries);
    }

    /**
     * Store a newly created SubAccountCategory in storage.
     *
     * @param CreateSubAccountCategoryRequest $request
     *
     * @return Response
     */
    public function store(CreateSubAccountCategoryRequest $request)
    {
        $input = $request->all();

        $numberLatest = SubAccountCategory::where('category_id', $request->category_id)->latest()->value('number');
        $number = $numberLatest + 1;
        $final = $request->category_id . $number;
        $subAccountCategory = $this->subAccountCategoryRepository->create(array_merge($input, ['number' => $final]));

        Flash::success('Sub Account Category saved successfully.');

        return redirect(route('subAccountCategories.index'));
    }

    /**
     * Display the specified SubAccountCategory.
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $subAccountCategory = $this->subAccountCategoryRepository->find($id);

        if (empty($subAccountCategory)) {
            Flash::error('Sub Account Category not found');

            return redirect(route('subAccountCategories.index'));
        }

        return view('mudir.sub_account_categories.show')->with('subAccountCategory', $subAccountCategory);
    }

    /**
     * Show the form for editing the specified SubAccountCategory.
     *
     * @param int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $subAccountCategory = $this->subAccountCategoryRepository->find($id);

        if (empty($subAccountCategory)) {
            Flash::error('Sub Account Category not found');

            return redirect(route('subAccountCategories.index'));
        }

        $countries = AccountCategory::all()->sortBy('title', SORT_NATURAL | SORT_FLAG_CASE)->pluck('title', 'id');

        return view('mudir.sub_account_categories.edit')->with('subAccountCategory', $subAccountCategory)->with('countries', $countries);
    }

    /**
     * Update the specified SubAccountCategory in storage.
     *
     * @param int $id
     * @param UpdateSubAccountCategoryRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateSubAccountCategoryRequest $request)
    {
        $subAccountCategory = $this->subAccountCategoryRepository->find($id);

        if (empty($subAccountCategory)) {
            Flash::error('Sub Account Category not found');

            return redirect(route('subAccountCategories.index'));
        }

        $subAccountCategory = $this->subAccountCategoryRepository->update($request->all(), $id);

        Flash::success('Sub Account Category updated successfully.');

        return redirect(route('subAccountCategories.index'));
    }

    /**
     * Remove the specified SubAccountCategory from storage.
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        $subAccountCategory = $this->subAccountCategoryRepository->find($id);

        if (empty($subAccountCategory)) {
            Flash::error('Sub Account Category not found');

            return redirect(route('subAccountCategories.index'));
        }

        $this->subAccountCategoryRepository->delete($id);

        Flash::success('Sub Account Category deleted successfully.');

        return redirect(route('subAccountCategories.index'));
    }
}
