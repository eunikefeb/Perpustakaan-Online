<?php
    include "koneksi.php";
    if($_POST['simpan']){
    $nama_buku=$_POST['nama_buku'];
    $deskripsi=$_POST['deskripsi'];
    
    //upload foto
    $ekstensi = array("png","jpg","jpeg");
    $namafile = $_FILES['file']['name'];
    $tmp = $_FILES['file']['tmp_name'];
    // $tipe_file = pathinfo($namafile, PATHINFO_EXSTENSION);
    $ukuran = $_FILES['file']['size'];

    if(empty($nama_buku)){ 
        echo "<script>alert('nama buku tidak boleh kosong');location.href='tambah_buku.php';</script>";
    } 
        else{
            // if(!in_array($tipe_file, $ekstensi)){
            //     header("location:tambah_buku.php?alert=gagal_ekstensi");
            // }else{
                if($ukuran <1044070){
                    move_uploaded_file($tmp, 'assets/foto_produk/'.$namafile);
                    $query = mysqli_query($koneksi, "INSERT INTO buku (nama_buku,deskripsi, foto) VALUE ('".$nama_buku."', '".$deskripsi."','".$namafile."')");
                    if($query){
                        echo "<script>alert('Sukses menambahkan buku');location.href='buku.php';</script>";  
                    }
                    else{
                        echo "<script>alert('Gagal upload gambar');location.href='tambah_buku.php';</script>";
                    }
                }else{
                    echo "<script>alert('Ukuran file terlalu besar');location.href='tambah_buku.php';</script>";
                }
            // }    
        }
    }
?>