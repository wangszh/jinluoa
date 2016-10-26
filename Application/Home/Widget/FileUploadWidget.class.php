<?php
namespace Home\Widget;
use Think\Controller;
class FileUploadWidget extends Controller {
	protected $config = array('app_type' => 'public');

	public function add() {
		$this -> display('Widget:FileUpload/add');
	}

	public function add1() {
		$this -> display('Widget:FileUpload/add1');
	}

	public function edit($add_file) {
		if (!empty($add_file)) {
			$files = array_filter(explode(';', $add_file));
			$files = array_map(think_decrypt, $files);

			$where['id'] = array('in', $files);
			$model = M("File");
			$file_list = $model -> where($where) -> select();
			$data['file_list'] = $file_list;
			$this -> assign($data);
		}		
		$this -> display('Widget:FileUpload/edit');
	}
    
	public function edit2($add_file) {
		if (!empty($add_file)) {
			$files = array_filter(explode(';', $add_file));
			$files = array_map(think_decrypt, $files);

			$where['id'] = array('in', $files);
			$model = M("File");
			$file_list = $model -> where($where) -> select();
			$data['file_list1'] = $file_list1;
			$this -> assign($data);
		}		
		$this -> display('Widget:FileUpload/edit2');
	}


	public function view($add_file) {
		if (!empty($add_file)) {
			$files = array_filter(explode(';', $add_file));
			$files = array_map('think_decrypt', $files);

			$where['id'] = array('in', $files);
			$model = M("File");
			$file_list = $model -> where($where) -> select();
			$data['file_list'] = $file_list;
			$this -> assign($data);
		}
		$this -> display('Widget:FileUpload/view');
	}

	public function link($add_file) {
		if (!empty($add_file)) {
			$files = array_filter(explode(';', $add_file));
			$files = array_map(think_decrypt, $files);

			$where['id'] = array('in', $files);
			$model = M("File");
			$file_list = $model -> where($where) -> select();
			$data['file_list'] = $file_list;
		}
		$this -> assign($data);
		$this -> display('Widget:FileUpload/link');
	}

		public function show($add_file) {
		if (!empty($add_file)) {
			$files = array_filter(explode(';', $add_file));
			$files = array_map(think_decrypt, $files);

			$where['id'] = array('in', $files);
            $where['mime'] = array('eq', 'image/jpeg');
			$model = M("File");
			$file_list = $model -> where($where) -> select();
			$data['file_list'] = $file_list;
		}
		$this -> assign($data);
		$this -> display('Widget:FileUpload/show');
	}

	public function show1($add_file) {
		if (!empty($add_file)) {
			$files = array_filter(explode(';', $add_file));
			$files = array_map(think_decrypt, $files);

			$where['id'] = array('in', $files);
            $where['ext'] = array('in', 'mp4,MOV,aac');
			$model = M("File");
			$file_list = $model -> where($where) -> select();
			$data['file_list'] = $file_list;
		}
		$this -> assign($data);
		$this -> display('Widget:FileUpload/show1');
	}

    public function show2($add_file) {
		if (!empty($add_file)) {
			$files = array_filter(explode(';', $add_file));
			$files = array_map(think_decrypt, $files);

			$where['id'] = array('in', $files);
            $where['mime'] = array('eq', 'image/jpeg');
			$model = M("File");
			$file_list1 = $model -> where($where) -> select();
			$data['file_list1'] = $file_list1;
		}
		$this -> assign($data);
		$this -> display('Widget:FileUpload/show2');
	}

	 public function show3($add_file) {
		if (!empty($add_file)) {
			$files = array_filter(explode(';', $add_file));
			$files = array_map(think_decrypt, $files);

			$where['id'] = array('in', $files);
            $where['ext'] = array('in', 'mp4,MOV');
			$model = M("File");
			$file_list1 = $model -> where($where) -> select();
			$data['file_list1'] = $file_list1;
		}
		$this -> assign($data);
		$this -> display('Widget:FileUpload/show3');
	}

}
?>