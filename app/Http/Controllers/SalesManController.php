<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateSalesManRequest;
use App\Http\Requests\UpdateSalesManRequest;
use App\Repositories\SalesManRepository;
use App\Http\Controllers\AppBaseController;
use Illuminate\Http\Request;
use Flash;
use Response;

class SalesManController extends AppBaseController
{
    /** @var  SalesManRepository */
    private $salesManRepository;

    public function __construct(SalesManRepository $salesManRepo)
    {
        $this->salesManRepository = $salesManRepo;
    }

    /**
     * Display a listing of the SalesMan.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function index(Request $request)
    {
        $salesMen = $this->salesManRepository->all();

        return view('mudir.sales_men.index')
            ->with('salesMen', $salesMen);
    }

    /**
     * Show the form for creating a new SalesMan.
     *
     * @return Response
     */
    public function create()
    {
        return view('mudir.sales_men.create');
    }

    /**
     * Store a newly created SalesMan in storage.
     *
     * @param CreateSalesManRequest $request
     *
     * @return Response
     */
    public function store(CreateSalesManRequest $request)
    {
        $input = $request->all();

        $salesMan = $this->salesManRepository->create($input);

        Flash::success('Sales Man saved successfully.');

        return redirect(route('salesMen.index'));
    }

    /**
     * Display the specified SalesMan.
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $salesMan = $this->salesManRepository->find($id);

        if (empty($salesMan)) {
            Flash::error('Sales Man not found');

            return redirect(route('salesMen.index'));
        }

        return view('mudir.sales_men.show')->with('salesMan', $salesMan);
    }

    /**
     * Show the form for editing the specified SalesMan.
     *
     * @param int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $salesMan = $this->salesManRepository->find($id);

        if (empty($salesMan)) {
            Flash::error('Sales Man not found');

            return redirect(route('salesMen.index'));
        }

        return view('mudir.sales_men.edit')->with('salesMan', $salesMan);
    }

    /**
     * Update the specified SalesMan in storage.
     *
     * @param int $id
     * @param UpdateSalesManRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateSalesManRequest $request)
    {
        $salesMan = $this->salesManRepository->find($id);

        if (empty($salesMan)) {
            Flash::error('Sales Man not found');

            return redirect(route('salesMen.index'));
        }

        $salesMan = $this->salesManRepository->update($request->all(), $id);

        Flash::success('Sales Man updated successfully.');

        return redirect(route('salesMen.index'));
    }

    /**
     * Remove the specified SalesMan from storage.
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        $salesMan = $this->salesManRepository->find($id);

        if (empty($salesMan)) {
            Flash::error('Sales Man not found');

            return redirect(route('salesMen.index'));
        }

        $this->salesManRepository->delete($id);

        Flash::success('Sales Man deleted successfully.');

        return redirect(route('salesMen.index'));
    }
}
