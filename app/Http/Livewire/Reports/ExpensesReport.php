<?php

namespace App\Http\Livewire\Reports;

use Livewire\Component;
use Livewire\WithPagination;
use Modules\Expense\Entities\Expense;
use Modules\Expenses\Entities\ExpenseCategory;

class ExpensesReport extends Component
{

    use WithPagination;

    protected $paginationTheme = 'bootstrap';

    public $expenses;
    public $start_date;
    public $end_date;
    public $category_name;

    protected $rules = [
        'start_date' => 'required|date|before:end_date',
        'end_date'   => 'required|date|after:start_date',
    ];

    public function mount($expenses) {
        $this->expenses = $expenses;
        $this->start_date = today()->subDays(30)->format('Y-m-d');
        $this->end_date = today()->format('Y-m-d');
        $this->category_name = '';
    }

    public function render() {
        $expense = Expense::whereDate('date', '>=', $this->start_date)
            ->whereDate('date', '<=', $this->end_date)
            ->when($this->category_name, function ($query) {
                return $query->where('category_name', $this->category_name);
            })
            ->orderBy('date', 'desc')->paginate(10);

        return view('livewire.reports.expenses-report', [
            'expense' => $expense
        ]);
    }

    public function generateReport() {
        $this->validate();
        $this->render();
    }
}
