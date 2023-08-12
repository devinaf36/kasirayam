<div>
    <div class="row">
        <div class="col-12">
            <div class="card border-0 shadow-sm">
                <div class="card-body">
                    <form wire:submit.prevent="generateReport">
                        <div class="form-row">
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label>Dari Tanggal <span class="text-danger">*</span></label>
                                    <input wire:model.defer="start_date" type="date" class="form-control" name="start_date">
                                    @error('start_date')
                                    <span class="text-danger mt-1">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label>Hingga Tanggal <span class="text-danger">*</span></label>
                                    <input wire:model.defer="end_date" type="date" class="form-control" name="end_date">
                                    @error('end_date')
                                    <span class="text-danger mt-1">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label>Kategri</label>
                                    <select wire:model.defer="category_name" class="form-control" name="category_name">
                                        <option value="">Pilih Kategori</option>
                                        @foreach($expenses as $expense)
                                            <option value="{{ $expense->category_name }}">{{ $expense->category_name }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group mb-0">
                            <button type="submit" class="btn btn-primary">
                                <span wire:target="generateReport" wire:loading class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                                <i wire:target="generateReport" wire:loading.remove class="bi bi-shuffle"></i>
                                Filter Report
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-12">
            <div class="card border-0 shadow-sm">
                <div class="card-body">
                    <table class="table table-bordered table-striped text-center mb-0">
                        <div wire:loading.flex class="col-12 position-absolute justify-content-center align-items-center" style="top:0;right:0;left:0;bottom:0;background-color: rgba(255,255,255,0.5);z-index: 99;">
                            <div class="spinner-border text-primary" role="status">
                                <span class="sr-only">Loading...</span>
                            </div>
                        </div>
                        <thead>
                        <tr>
                            <th>Tanggal</th>
                            <th>Reference</th>
                            <th>Kategori</th>
                            <th>Total</th>
                            <th>Detail</th>
                        </tr>
                        </thead>
                        <tbody>
                        @forelse($expenses as $expense)
                            <tr>
                                <td>{{ \Carbon\Carbon::parse($expense->date)->format('d M, Y') }}</td>
                                <td>{{ $expense->reference }}</td>
                                <td>{{ $expense->category_name }}</td>
                                {{-- <td>
                                    @if ($sale->status == 'Pending')
                                        <span class="badge badge-info">
                                    {{ $sale->status }}
                                </span>
                                    @elseif ($sale->status == 'Sedang Proses')
                                        <span class="badge badge-primary">
                                    {{ $sale->status }}
                                </span>
                                    @else
                                        <span class="badge badge-success">
                                    {{ $sale->status }}
                                </span>
                                    @endif
                                </td> --}}
                                <td>{{ format_currency($expense->total_amount) }}</td>
                                <td>{{ $expense->expensesDetails }}</td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="8">
                                    <span class="text-danger">Tidak ada data Pengeluaran!</span>
                                </td>
                            </tr>
                        @endforelse
                        </tbody>
                    </table>
                    <div @class(['mt-3' => $expenses->hasPages()])>
                        {{ $expenses->links() }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
