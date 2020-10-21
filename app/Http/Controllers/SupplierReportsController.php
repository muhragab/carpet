<?php

namespace App\Http\Controllers;

use App\AccountStatement;
use App\Models\Purchases\BackPurchase;
use App\Models\Purchases\Purchase;
use App\Models\Purchases\Supplier;
use App\Models\Sales\BackSale;
use App\Models\Sales\Sale;
use Illuminate\Http\Request;

class SupplierReportsController extends Controller
{
    public function supplierReport(Request $request)
    {
        $type = $request->is_client;
        if ($type == 1)
            $suppliers = Supplier::where('is_client', 1)->get();
        elseif ($type == 2)
            $suppliers = Supplier::where('is_supplier', 1)->get();

        $data = array();
        foreach ($suppliers as $supplier) {
            $supplier['creditor'] = AccountStatement::where('statement_type', 'creditor')->where('category', $supplier->id)->sum('amount');
            $supplier['debtor'] = AccountStatement::where('statement_type', 'debtor')->where('category', $supplier->id)->sum('amount');
            $supplier['purchase'] = Purchase::where('supplier_id', $supplier->id)->sum('finalPrice');
            $supplier['purchaseBack'] = BackPurchase::where('supplier_id', $supplier->id)->sum('finalPrice');
            $supplier['sale'] = Sale::where('supplier_id', $supplier->id)->sum('finalPrice');
            $supplier['saleBack'] = BackSale::where('supplier_id', $supplier->id)->sum('finalPrice');
            if ($supplier['creditor'] != 0 || $supplier['debtor'] != 0 || $supplier['purchase'] != 0 || $supplier['purchaseBack'] != 0 || $supplier['sale'] != 0 || $supplier['saleBack'] != 0)
                $data[] = $supplier;
        }
        return view('mudir.supplier_report.index', compact('data'));
    }

    public function supplierCreditorDetails($id)
    {
        $creditor = AccountStatement::where('statement_type', 'creditor')->where('category', $id)->get();

        return view('mudir.supplier_report.creditors', compact([
            'creditor'
        ]));
    }
    public function supplierDebtorDetails($id)
    {
        $debtors =  AccountStatement::where('statement_type', 'debtor')->where('category', $id)->get();
        return view('mudir.supplier_report.debtor', compact([
            'debtors'
        ]));
    }
    public function supplierPurchasesBackDetails($id)
    {
        $purchasesBack =  BackPurchase::where('supplier_id', $id)->get();
        return view('mudir.supplier_report.purchases_back', compact([
            'purchasesBack'
        ]));
    }
    public function supplierPurchasesDetails($id)
    {
        $purchases =  Purchase::where('supplier_id', $id)->get();
        return view('mudir.supplier_report.purchases', compact([
            'purchases'
        ]));
    }
    public function supplierSalesBackDetails($id)
    {
        $salesBack =  BackSale::where('supplier_id', $id)->get();
        return view('mudir.supplier_report.sales_back', compact([
            'salesBack'
        ]));
    }
    public function supplierSalesDetails($id)
    {
        $sales =  Sale::where('supplier_id', $id)->get();
        return view('mudir.supplier_report.sales', compact([
            'sales'
        ]));
    }
}
