@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8" style="margin-top: 2%">
                <div class="card" style="width: 40rem;">
                    <div class="card-body">
                        <h4 class="card-title">Verifikasi Email</h4>
                        @if (session('resent'))
                            <p class="alert alert-success" role="alert">Link verifikasi baru telah dikirim ke
                                alamat email Anda</p>
                        @endif
                        <p class="card-text">Sebelum melanjutkan, silakan periksa email Anda untuk link verifikasi.Jika Anda
                            tidak menerima email,</p>
                        <a href="{{ route('verification.resend') }}">Klik ini untuk Kirim Ulang</a>.
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
