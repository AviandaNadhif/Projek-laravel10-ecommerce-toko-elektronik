@extends('backend.layouts.master')
@section('main-content')
    <div class="container-fluid">
        <h4 class="mb-3">Troubleshoot — Pemeriksaan cepat</h4>

        <div class="card">
            <div class="card-body">
                <table class="table table-sm table-bordered">
                    <thead>
                        <tr>
                            <th>Item</th>
                            <th>Status</th>
                            <th>Detail</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($results as $r)
                            <tr>
                                <td>{{ $r['name'] }}</td>
                                <td>
                                    @if($r['status'] === 'OK' || Str::startsWith($r['status'], '8') || Str::startsWith($r['status'], '7') || Str::startsWith($r['status'], '9'))
                                        <span class="badge badge-success">{{ $r['status'] }}</span>
                                    @elseif($r['status'] === 'EMPTY')
                                        <span class="badge badge-warning">EMPTY</span>
                                    @else
                                        <span class="badge badge-danger">{{ $r['status'] }}</span>
                                    @endif
                                </td>
                                <td style="word-break: break-word">{{ $r['detail'] }}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>

                <a href="{{ url()->previous() }}" class="btn btn-secondary">Kembali</a>
                <a href="{{ route('storage.link') }}" class="btn btn-warning">Perbaiki: Storage Link</a>
                <a href="{{ url('/cache-clear') }}" class="btn btn-danger">Jalankan: Bersihkan Cache</a>
            </div>
        </div>
    </div>
@endsection
