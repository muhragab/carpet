<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateSupplierPriceRequest;
use App\Http\Requests\UpdateSupplierPriceRequest;
use App\Models\Products\ProductTypes;
use App\Models\Purchases\Supplier;
use App\Repositories\SupplierPriceRepository;
use App\Http\Controllers\AppBaseController;
use Illuminate\Http\Request;
use Flash;
use Response;

class SupplierPriceController extends AppBaseController
{
    /** @var  SupplierPriceRepository */
    private $supplierPriceRepository;

    public function __construct(SupplierPriceRepository $supplierPriceRepo)
    {
        $this->supplierPriceRepository = $supplierPriceRepo;
    }

    /**
     * Display a listing of the SupplierPrice.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function index(Request $request)
    {
        $supplierPrices = $this->supplierPriceRepository->all();

        return view('mudir.supplier_prices.index')
            ->with('supplierPrices', $supplierPrices);
    }

    /**
     * Show the form for creating a new SupplierPrice.
     *
     * @return Response
     */
    public function create()
    {
        $suppilers = Supplier::where('is_client', 1)->get();
        $productTypes = ProductTypes::get();
        return view('mudir.supplier_prices.create', compact(['suppilers', 'productTypes']));
    }

    /**
     * Store a newly created SupplierPrice in storage.
     *
     * @param CreateSupplierPriceRequest $request
     *
     * @return Response
     */
    public function store(CreateSupplierPriceRequest $request)
    {
        $input = $request->all();

        $supplierPrice = $this->supplierPriceRepository->create($input);

        Flash::success('Supplier Price saved successfully.');

        return redirect(route('supplierPrices.create'));
    }

    /**
     * Display the specified SupplierPrice.
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $supplierPrice = $this->supplierPriceRepository->find($id);

        if (empty($supplierPrice)) {
            Flash::error('Supplier Price not found');

            return redirect(route('supplierPrices.index'));
        }

        return view('mudir.supplier_prices.show')->with('supplierPrice', $supplierPrice);
    }

    /**
     * Show the form for editing the specified SupplierPrice.
     *
     * @param int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $supplierPrice = $this->supplierPriceRepository->find($id);

        if (empty($supplierPrice)) {
            Flash::error('Supplier Price not found');

            return redirect(route('supplierPrices.index'));
        }
        $suppilers = Supplier::where('is_client', 1)->get();
        $productTypes = ProductTypes::get();
        return view('mudir.supplier_prices.edit', compact(['suppilers', 'productTypes']))->with('supplierPrice', $supplierPrice);
    }

    /**
     * Update the specified SupplierPrice in storage.
     *
     * @param int $id
     * @param UpdateSupplierPriceRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateSupplierPriceRequest $request)
    {
        $supplierPrice = $this->supplierPriceRepository->find($id);

        if (empty($supplierPrice)) {
            Flash::error('Supplier Price not found');

            return redirect(route('supplierPrices.index'));
        }

        $supplierPrice = $this->supplierPriceRepository->update($request->all(), $id);

        Flash::success('Supplier Price updated successfully.');

        return redirect(route('supplierPrices.index'));
    }

    /**
     * Remove the specified SupplierPrice from storage.
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        $supplierPrice = $this->supplierPriceRepository->find($id);

        if (empty($supplierPrice)) {
            Flash::error('Supplier Price not found');

            return redirect(route('supplierPrices.index'));
        }

        $this->supplierPriceRepository->delete($id);

        Flash::success('Supplier Price deleted successfully.');

        return redirect(route('supplierPrices.index'));
    }
}
