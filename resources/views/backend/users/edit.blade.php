@extends('backend.layouts.master')

@section('main-content')

<div class="card">
    <h5 class="card-header">Sunting Pengguna</h5>
    <div class="card-body">
      <form method="post" action="{{route('users.update',$user->id)}}">
        @csrf 
        @method('PATCH')
        <div class="form-row">
            <div class="form-group col-md-6">
              <label for="inputTitle" class="col-form-label">Nama</label>
              <input id="inputTitle" type="text" name="name" placeholder="Masukkan nama"  value="{{$user->name}}" class="form-control">
              @error('name')
              <span class="text-danger">{{$message}}</span>
              @enderror
            </div>

            <div class="form-group col-md-6">
                <label for="inputEmail" class="col-form-label">Email</label>
                <input id="inputEmail" type="email" name="email" placeholder="Masukkan email"  value="{{$user->email}}" class="form-control">
                @error('email')
                <span class="text-danger">{{$message}}</span>
                @enderror
            </div>
        </div>

        {{-- <div class="form-group">
            <label for="inputPassword" class="col-form-label">Password</label>
          <input id="inputPassword" type="password" name="password" placeholder="Enter password"  value="{{$user->password}}" class="form-control">
          @error('password')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div> --}}

        <div class="form-row">
          <div class="form-group col-md-6">
            <label for="inputPhoto" class="col-form-label">Foto</label>
            <div class="input-group">
              <div class="input-group-prepend">
                <button id="lfm" data-input="thumbnail" data-preview="holder" class="btn btn-primary" type="button">
                  <i class="fa fa-picture-o"></i> Pilih
                </button>
              </div>
              <input id="thumbnail" class="form-control" type="text" name="photo" value="{{$user->photo}}">
            </div>
            <div class="mt-2">
              <img id="holder" src="{{ $user->photo ? image_url($user->photo) : asset('images/placeholder.png') }}" class="img-fluid" style="max-height:150px;" alt="Preview Foto Pengguna">
            </div>
            @error('photo')
            <span class="text-danger">{{$message}}</span>
            @enderror
          </div>

          <div class="form-group col-md-6">
            <label for="role" class="col-form-label">Peran</label>
            <select name="role" class="form-control">
              <option value="">-----Pilih Peran-----</option>
              <option value="admin" {{($user->role=='admin' ? 'selected' : '')}}>Admin</option>
              <option value="user" {{($user->role=='user' ? 'selected' : '')}}>User</option>
            </select>
            @error('role')
            <span class="text-danger">{{$message}}</span>
            @enderror
          </div>
        </div>
          <div class="form-group">
            <label for="status" class="col-form-label">Status</label>
            <select name="status" class="form-control">
              <option value="active" {{($user->status=='active' ? 'selected' : '')}}>Aktif</option>
              <option value="inactive" {{($user->status=='inactive' ? 'selected' : '')}}>Tidak Aktif</option>
            </select>
          @error('status')
          <span class="text-danger">{{$message}}</span>
          @enderror
          </div>
        <div class="form-group mb-3">
           <button class="btn btn-success btn-block" type="submit">Simpan Perubahan</button>
        </div>
      </form>
    </div>
</div>

@endsection

@push('scripts')
<script src="/vendor/laravel-filemanager/js/stand-alone-button.js"></script>
<script>
    $('#lfm').filemanager('image');
</script>
@endpush