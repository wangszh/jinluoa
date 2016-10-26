<?php
/*--------------------------------------------------------------------
 小微OA系统 - 让工作更轻松快乐

 Copyright (c) 2013 http://www.smeoa.com All rights reserved.

 Author:  jinzhu.yin<smeoa@qq.com>

 Support: https://git.oschina.net/smeoa/xiaowei
 --------------------------------------------------------------*/
namespace Home\Controller;

class TaskController extends HomeController {
	protected $config = array('app_type' => 'common', 'read' => 'let_me_do,accept,reject,save_log,yanshou,tfield_manage,tongji,tupian');

	//过滤查询字段
	function _search_filter(&$map) {
		$map['is_del'] = array('eq', '0');
		if (!empty($_REQUEST['keyword']) && empty($map['64'])) {
			$map['name'] = array('like', "%" . $_POST['keyword'] . "%");
		}
	}

	public function index() {
        
		$auth = $this -> config['auth'];
		if ($auth['admin']) {
		$this -> redirect('folder', array('fid' => 'all'));
		}else {
        $this -> redirect('folder', array('fid' => 'no_finish'));  
		}
	}

	/*--------------------------------------------------------------------
	 * 任务状态说明
	 * 1:未处理
	 * 2:进行中
	 * 3:已完成
	 * 4:已拒绝
	 * 5:已关闭

	 --------------------------------------------------------------*/
	public function folder() {
		$plugin['date'] = true;
		$this -> assign("plugin", $plugin);
		$this -> assign('auth', $this -> config['auth']);
		$this -> assign('user_id', get_user_id());

		$where = $this -> _search();
		if (method_exists($this, '_search_filter')) {
			$this -> _search_filter($where);
		}

		$no_finish_task_count = badge_count_no_finish_task();
		$dept_task_count = badge_count_dept_task();
		$no_assign_task_count = badge_count_no_assign_task();

		$this -> assign('no_finish_task_count', $no_finish_task_count);
		$this -> assign('dept_task_count', $dept_task_count);
		$this -> assign('no_assign_task_count', $no_assign_task_count);

		$fid = $_GET['fid'];
		$this -> assign("fid", $fid);

		$where['company_id']=session('company_id');

		switch ($fid) {
			case 'all' :
				$this -> assign("folder_name", '所有任务');
				break;
            //等待验收
			case 'ys':
                $this -> assign("folder_name", '等待验收任务');
			    
				
				//$where_log['executor'] = get_user_id();
				$where_log['type'] = array('eq', 1);

				$task_list = M("TaskLog") -> where($where_log) -> getField('task_id', true);
				if (empty($task_list)) {
					$where['_string'] = '1=2';
				} else {
					$where['id'] = array('in', $task_list);
					$where['status'] = array('eq', 30);
				}
				break;
            
			case 'ys_finish':
                $this -> assign("folder_name", '验收完成');
			    
				
				//$where_log['executor'] = get_user_id();
				$where_log['type'] = array('eq', 1);

				$task_list = M("TaskLog") -> where($where_log) -> getField('task_id', true);
				if (empty($task_list)) {
					$where['_string'] = '1=2';
				} else {
					$where['id'] = array('in', $task_list);
					$where['status'] = array('eq', 40);
				}
				break;
      
				
			case 'dept' :
				$this -> assign("folder_name", '我们部门的任务');
				$auth = $this -> config['auth'];

				if ($auth['admin']) {
					$where_log['type'] = 2;
					$where_log['status'] = array('eq', '0');
					$where_log['executor'] = get_dept_id();
					$task_list = M("TaskLog") -> where($where_log) -> getField('task_id', TRUE);
					if (empty($task_list)) {
						$where['_string'] = '1=2';
					} else {
						$where['id'] = array('in', $task_list);
					}
				} else {
					$where['_string'] = '1=2';
				}
				break;

			case 'no_assign' :
				$this -> assign("folder_name", '不知道由谁处理的任务');

				$prefix = C('DB_PREFIX');

				$assign_list = M("Task") -> getField('id', true);

				$sql = "select id from {$prefix}task task where status=0 and not exists (select * from {$prefix}task_log task_log where task.id=task_log.task_id)";
				$task_list = M() -> query($sql);

				if (empty($task_list)) {
					$where['_string'] = '1=2';
				} else {
					foreach ($task_list as $key => $val) {
						$list[] = $val['id'];
					}
					$where['id'] = array('in', $list);
				}

				break;

			case 'no_finish' :
				$this -> assign("folder_name", '我未完成');

				$where_log['status'] = array('lt', 20);
				$where_log['executor'] = get_user_id();
				$where_log['type'] = array('eq', 1);

				$task_list = M("TaskLog") -> where($where_log) -> getField('task_id', true);
				if (empty($task_list)) {
					$where['_string'] = '1=2';
				} else {
					$where['id'] = array('in', $task_list);
				}

				break;

			case 'finished' :
				$this -> assign("folder_name", '我已完成');

				$where_log['executor'] = get_user_id();
				$where_log['type'] = array('eq', 1);

				$task_list = M("TaskLog") -> where($where_log) -> getField('task_id', true);
				if (empty($task_list)) {
					$where['_string'] = '1=2';
				} else {
					$where['id'] = array('in', $task_list);
					$where['status'] = array('eq', 30);
				}
				break;

			case 'my_task' :
				$this -> assign("folder_name", '我发布的任务');
				$where['user_id'] = get_user_id();
				break;

			case 'my_assign' :
				$this -> assign("folder_name", '我指派的任务');

				$where_log['assigner'] = get_user_id();
				$task_list = M("TaskLog") -> where($where_log) -> getField('task_id', TRUE);
				if (empty($task_list)) {
					$where['_string'] = '1=2';
				} else {
					$where['id'] = array('in', $task_list);
				}
				break;

			default :
				break;
		}

		$model = D('Task');
		if (!empty($model)) {
			$this -> _list($model, $where);
		}
		$this -> display();
	}

	public function edit($id) {
		$plugin['uploader'] = true;
		$plugin['editor'] = true;
		$plugin['date'] = true;
		$this -> assign("plugin", $plugin);

		

		$model = M("Task");

	

		$this -> _edit($id);
	}

		/**编辑页面 **/
	public function _edit($id, $name = 'Task') {
		$model = M('Task');
		$vo = $model -> find($id);

      
		if (IS_AJAX) {
			if ($vo !== false) {// 读取成功
				$return['data'] = $vo;
				$return['status'] = 1;
				$return['info'] = "读取成功";
				
				$this -> ajaxReturn($return);
			} else {
				$return['status'] = 0;
				$return['info'] = "读取错误";
				$this -> ajaxReturn($return);
			}
		}
		$this -> assign('vo', $vo);

	    $field_list = D("UdfField") -> get_data_list($vo['udf_data']);
		$this -> assign("field_list", $field_list);
 
		$this -> display();

		return $vo;
	}


	public function del($id) {
		$this -> _del($id);
	}

	public function add() {
		$plugin['uploader'] = true;
		$plugin['jquery-ui'] = true;
		$plugin['editor'] = true;
		$plugin['date'] = true;
		$this -> assign("plugin", $plugin);


        $type_id = session('company_id');
        $model_flow_field = D("UdfField");
		$field_list = $model_flow_field -> get_field_list($type_id);
		$this -> assign("field_list", $field_list);

		$this -> display();
	}

	public function read($id) {

		$plugin['jquery-ui'] = true;
		$plugin['editor'] = true;
		$plugin['date'] = true;
		$plugin['uploader1'] = true;

		$this -> assign("plugin", $plugin);
		$auth = $this -> config['auth'];
		$this -> assign('auth', $auth);

		$this -> assign('task_id', $id);

		$model = M("Task");
		$vo = $model -> find($id);
		$this -> assign('vo', $vo);
        
		if ($vo['status']==30) {
			$this -> assign('ys', 1);
		}


      

	

		$where_log['task_id'] = array('eq', $id);
		$task_log = M("TaskLog") -> where($where_log) -> select();
		//var_dump(M("TaskLog") -> where($where_log) -> select());

		$this -> assign('task_log', $task_log);
		if (empty($vo['executor'])) {
			$this -> assign('no_assign', 1);
		}

		

        //$where_log['status'] = array('eq', 3);
		//$task_log = M("TaskLog") -> select();
		//$this -> assign('task_log', $task_log);
		//if (!empty($task_log)) {
			//$this -> assign('ys', 1);
		//}


		$where_accept['status'] = 0;
		$where_accept['task_id'] = $id;
		$where_accept['type'] = 1;
		$where_accept['executor'] = array('eq', get_user_id());
		$task_accept = M("TaskLog") -> where($where_accept) -> find();

		if ($task_accept) {
			$this -> assign('is_accept', 1);
			$this -> assign('task_log_id', $task_accept['id']);
		}

		if ($this -> config['auth']['admin']) {
			$where_dept_accept['status'] = 0;
			$where_dept_accept['task_id'] = $id;
			$where_dept_accept['type'] = 2;
			$where_dept_accept['executor'] = array('eq', get_dept_id());
			$task_dept_accept = M("TaskLog") -> where($where_dept_accept) -> find();
			if ($task_dept_accept) {
				$this -> assign('is_accept', 1);
				$this -> assign('task_log_id', $task_dept_accept['id']);
			}
		}

		$where_working['status'] = array('in', '0,10');
		$where_working['task_id'] = $id;
		$where_working['type'] = 1;
		$where_working['executor'] = array('eq', get_user_id());
		$task_working = M("TaskLog") -> where($where_working) -> find();

		if (empty($task_working) && $auth['write']) {
			$where_working['type'] = 2;
			$where_working['executor'] = array('eq', get_dept_id());
			$task_working = M("TaskLog") -> where($where_working) -> find();
		}

		if ($task_working) {
			$this -> assign('is_working', 1);
			$this -> assign('task_working', $task_working);

		}

	   

		$this -> display();
	}

	function let_me_do($task_id) {
		if (IS_POST) {
			M("Task") -> where("id=$task_id") -> setField('executor', get_user_name() . "|" . get_user_id());
			M("Task") -> where("id=$task_id") -> setField('status', 10);

			$data['task_id'] = I(task_id);
			$data['executor'] = get_user_id();
			$data['executor_name'] = get_user_name();
			$data['transactor'] = get_user_id();
			$data['transactor_name'] = get_user_name();
			$data['status'] = 10;
			//任务类型 1 个人 2 部门
            $data['type'] = 1;

			$task_id = I(task_id);
			$list = M("TaskLog") -> add($data);
			if ($list != false) {
				//$this -> _add_to_schedule($task_id);
				$return['info'] = '接受成功';
				$return['status'] = 1;
				$this -> ajaxReturn($return);
			} else {
				$this -> error('提交成功');
			}
		}
	}
    
	function yanshou($task_id) {

		
		if (IS_POST) {
           
			M("Task") -> where("id=$task_id") -> setField('status', 40);

			$data['task_id'] = I(task_id);
			$data['executor'] = get_user_id();
			$data['executor_name'] = get_user_name();
			$data['transactor'] = get_user_id();
			$data['transactor_name'] = get_user_name();
			$data['status'] = 40;
            $data['finish_rate'] = '100.00';
			$data['finish_time']=to_date(time());
			//任务类型 1 个人 2 部门
            $data['type'] = 1;

			$task_id = I(task_id);
			$list = M("TaskLog") -> add($data);
			if ($list != false) {
				//$this -> _add_to_schedule($task_id);
				$return['info'] = '验收成功';
				$return['status'] = 1;
				$this -> ajaxReturn($return);
			} else {
				$this -> error('提交成功');
			}
        
        
		}

       
	}




	function accept() {
		if (IS_POST) {
			$task_log_id = I('task_log_id');
			$data['id'] = $task_log_id;
			$data['transactor'] = get_user_id();
			$data['transactor_name'] = get_user_name();
			$data['status'] = 1;

			//任务类型 1 个人 2 部门
			//$data['type'] = 1;

			$list = M("TaskLog") -> save($data);

			$task_id = M("TaskLog") -> where("id=$task_log_id") -> getField('task_id');
			M("Task") -> where("id=$task_id") -> setField('status', 1);

			if ($list != false) {
				//$this -> _add_to_schedule($task_id);
				$return['info'] = '接受成功';
				$return['status'] = 1;
				$this -> ajaxReturn($return);
			} else {
				$this -> error('提交成功');
			}
		}
	}

	function reject() {
		$widget['editor'] = true;
		$this -> assign("widget", $widget);
		if (IS_POST) {
			$model = D("TaskLog");
			if (false === $model -> create()) {
				$this -> error($model -> getError());
			}
			$model -> transactor = get_user_id();
			$model -> transactor_name = get_user_name();
			$model -> finish_time = to_date(time());
			$list = $model -> save();
			$status = I('status');
			$task_id = I('task_id');
			if ($status > 2) {
				$where_count['task_id'] = array('eq', $task_id);
				$total_count = M("TaskLog") -> where($where_count) -> count();

				$where_count['status'] = array('gt', 2);
				$finish_count = M("TaskLog") -> where($where_count) -> count();
				if ($total_count == $finish_count) {
					M("Task") -> where("id=$task_id") -> setField('status', 5);
					$user_id = M('Task') -> where("id=$task_id") -> getField('user_id');

					$info = M("Task") -> where("id=$task_id") -> find();

					$transactor_name = get_user_name();

					$push_data['type'] = '任务';
					$push_data['action'] = '拒绝接受';
					$push_data['title'] = "{$transactor_name}拒绝接受您发起的[{$info['name']}]任务";
					$push_data['content'] = "如有问题，请与[{$transactor_name}]进行沟通。";
					$push_data['url'] = U("Task/read?id={$info['id']}");

					send_push($push_data, $user_id);
				}
			}
			if ($list !== false) {
				$this -> success('提交成功');
			} else {
				$this -> success('提交失败');
			}
		}

		$task_id = I('task_id');
		$where_log1['type'] = 1;
		$where_log1['executor'] = get_user_id();
		$where_log1['task_id'] = $task_id;
		$task_log1 = M("TaskLog") -> where($where_log1) -> find();
		if ($task_log1) {
			$this -> assign('task_log', $task_log1);
		} else {
			$where_log2['type'] = 2;
			$where_log2['executor'] = get_dept_id();
			$where_log2['task_id'] = $task_id;
			$task_log2 = M("TaskLog") -> where($where_log2) -> find();

			if ($task_log2) {
				$this -> assign('task_log', $task_log2);
			}
		}
		$this -> display();
	}

	public function tupian() {

		 
              // $img=$_POST('file1');

			import("ORG.Util.UploadFile");  
            //实例化上传类  
            $upload = new \Org\Util\UploadFile();  
            //$upload->maxSize = 3145728;  
            //设置文件上传类型  
            //$upload->allowExts = array('jpg','gif','png','jpeg');  
            //设置文件上传位置  
            $upload->savePath = "./Uploads/Download/task/";//这里说明一下，由于ThinkPHP是有入口文件的，所以这里的./Public是指网站根目录下的Public文件夹  
            //设置文件上传名(按照时间)  
            //$upload->saveRule = "time";  
            if (!$upload->upload()){  
                $this->error($upload->getErrorMsg());  
            }else{  
                //上传成功，获取上传信息  
                $info = $upload->getUploadFileInfo();  
				//$this->error($info[0]['savename']);
            }  
			//$this -> assign('img', $info[0]['savename']);
			//$this->ajaxReturn($info);	
			//return $info;

	}

	public function save_log($id) {

		//$this -> error(1111);
       
		$model = D("TaskLog");


		if (false === $model -> create()) {
			$this -> error($model -> getError());
		}

        //$this -> error(2222);
		$task_file1 = M("TaskLog") -> where("id=$id") -> getField('add_file');

        //$this -> error($task_file1);

		//$this -> error(3333);

		$model -> transactor = get_user_id();
		$model -> transactor_name = get_user_name();

		if(!empty($_POST['pic'])) {

			$model ->pic=$_POST['pic'];
			
		}


		$status = I('status');
		$finish_rate = I('finish_rate');
		$task_log_id = $id;

       // $this -> error(4444);
        
        $model ->add_file=$task_file1.I('add_file1');
        

		//$this -> error(5555);

		if ($finish_rate == '100.00') {
			$model -> finish_time = to_date(time());
			$model -> status = 20;
			$status = 20;
			
		}
		
		//$this -> error(6666);
		if($model -> status==22){
			$model -> finish_time = to_date(time());
		}

        //$this -> error(7777);

		$list = $model -> save();

		$task_id = M("TaskLog") -> where("id=$task_log_id") -> getField('task_id');

		if ($status == 10) {
			M("Task") -> where("id=$task_id") -> setField('status', 10);
		}

		if ($status >= 20) {
			$where_total_count['task_id'] = array('eq', $task_id);
			$total_count = M("TaskLog") -> where($where_total_count) -> count();

			$where_finish_count['task_id'] = array('eq', $task_id);
			$where_finish_count['status'] = array('egt', 20);
			$finish_count = M("TaskLog") -> where($where_finish_count) -> count();

			if ($total_count == $finish_count) {
				M("Task") -> where("id=$task_id") -> setField('status', 30);

				$user_id = M('Task') -> where("id=$task_id") -> getField('user_id');

				$task = M("Task") -> where("id=$task_id") -> find();

				$transactor_name = get_user_name();

				$push_data['type'] = '任务';
				$push_data['action'] = '已完成';
				$push_data['title'] = "{$transactor_name}已完成您发起的[{$task['name']}]任务";
				$push_data['content'] = "如有问题，请与[{$transactor_name}]进行沟通。";
				$push_data['url'] = U("Task/read?id={$task['id']}");

				send_push($push_data, $user_id);
			}
		}

		if ($status = 21) {
			$task_id = I('task_id');
			$forword_executor = I('forword_executor');
			D('Task') -> forword($task_id, $forword_executor);
		}
		if ($status = 22) {

		}
		if ($list !== false) {
			$this -> assign('jumpUrl', get_return_url());
			$this -> success('提交成功!');
			//成功提示
		} else {
			$this -> error('提交失败!');
			//错误提示
		}
	}

	function upload() {
		$this -> _upload();
	}

	function down($attach_id) {
		$this -> _down($attach_id);
	}

	private function _add_to_schedule($task_id) {
		$info = M("Task") -> where("id=$task_id") -> find();
		$data['name'] = $info['name'];
		$data['content'] = $info['content'];
		$data['start_time'] = to_date(time());
		$data['end_time'] = $info['expected_time'];
		$data['user_id'] = get_user_id();
		$data['user_name'] = get_user_name();
		$data['priority'] = 3;

		$list = M('Schedule') -> add($data);
	}

	function _send_mail_finish($task_id, $executor) {
		$executor_info = M("User") -> where("id=$executor") -> find();

		$email = $executor_info['email'];
		$user_name = $executor_info['name'];

		$info = M("Task") -> where("id=$task_id") -> find();

		$transactor_name = M("TaskLog") -> where("task_id=$task_id") -> getField('id,transactor_name');

		$transactor_name = implode(",", $transactor_name);

		$title = "您发布任务已完成：" . $info['name'];

		$body = "您好，{$user_name}，{$transactor_name} 完成了您发起的[{$info['name']}]任务</br>";
		$body .= "任务主题：{$info['name']}</br>";
		$body .= "任务时间：{$info['expected_time']}</br>";
		$body .= "任务执行人：{$transactor_name}</br>";
		$body .= "请及时检查任务执行情况，如有问题，请与[{$transactor_name}]进行沟通。</br>";
		$body .= "任务完成后请对[任务执行人]表达我们的感谢。</br>";

		$body .= "点击查看任务详情：http://" . $_SERVER['SERVER_NAME'] . U('Task/read', 'id=' . $info['id']) . "</br>";
		$body .= "霞湖世家，感谢有您！</br>";

		send_mail($email, $user_name, $title, $body);
	}

		public function tfield_manage() {
		$this -> assign("folder_name", "自定义字段管理");
	   
		$this -> _tfield_manage();
	}


	/** 插入新新数据  **/
	function _insert($name = CONTROLLER_NAME) {
        
		

		//$this -> error($_POST['pic']); 
  

         
		$model = D($name);
		if (false === $model -> create()) {
			$this -> error($model -> getError());
		}
		//$model->confirm_name=I('confirm_name');
		//$str_confirm = D("Flow") -> _conv_auditor($model -> confirm);
		//$str_consult = D("Flow") -> _conv_auditor($model -> consult);
		//$str_auditor = $str_confirm . $str_consult;
		//if (empty($str_auditor)) {
			//$this -> error('没有找到任何审核人');
		//}
        $model -> company_id=session('company_id');

         if(!empty($_POST['pic'])) {

			$model ->pic=$_POST['pic'];
			
		}


		$model -> udf_data = D('UdfField') -> get_field_data();

		$list = $model -> add();

		if ($list !== false) {//保存成功
			//$flow_filed = D("UdfField") -> set_field($list);
			$this -> assign('jumpUrl', get_return_url());
			$this -> success('任务发布成功!');
		} else {
			$this -> error('任务发布失败!');
			//失败提示
		}
	}

	/* 更新数据  */
	function _update($name = CONTROLLER_NAME) {
        


		$model = D($name);
		if (false === $model -> create()) {
			$this -> error($model -> getError());
		}
		//$flow_id = $model -> id;

        if(!empty($_POST['pic'])) {

			$model ->pic=$_POST['pic'];
			
		}

		$model -> company_id=session('company_id');
		$model -> udf_data = D('UdfField') -> get_field_data();

		//$this->error(I('add_file'));

		$list = $model -> save();
		if (false !== $list) {
			$this -> assign('jumpUrl', get_return_url());
			$this -> success('任务编辑成功!');
			//成功提示
		} else {
			$this -> error('任务编辑失败!');
			//错误提示
		}
	}

    //统计数据
    function tongji(){

		import("Org.Util.GoogChart");
		

		$chart = new \Org\Util\GoogChart();

        //$range=I('range');

		$range = $_GET['range'];
		$this -> assign("range", $range);
		if($range==null){
            $range='m';
		}

		
		switch ($range) {
			case 'm':
				$offset=mktime(0, 0 , 0,date("m")-1,date("d"),date("Y"));
				break;

			case 'q':
				$offset=mktime(0, 0 , 0,date("m")-3,date("d"),date("Y"));
				break;
				
			case 'y':
				$offset=mktime(0, 0 , 0,date("m")-112,date("d"),date("Y"));
				break;							
			default:
				
				break;
		}
 
       $where['create_time']=array('egt',$offset);
       $where['company_id']=session('company_id');
       //var_dump($offset);


	   $m = M('Task');//请将Test修改为你想要获取数据的表group("from_unixtime(create_time,'%Y-%m-%d') as create_time")->
							
	   $engine=$m->field("FROM_UNIXTIME(create_time,'%Y年%m月%d') as ctime")->where($where)->group("FROM_UNIXTIME(create_time,'%Y年%m月%d')") ->select();
	
	  					


	   //设置$data数组数据;
	   foreach($engine as $k=>$value)
		{
		   $data0 .= "'".$value[ctime]."'".",";
	    }
	   $data0 = substr($data0, 0, -1);
	   $this->assign('data0',$data0);	

      
	   $m = M('Task');//请将Test修改为你想要获取数据的表
					//解释一下数据的含义：field("求和所有的sale 作为 sum") -> 条件是($where) ->通过('time')分组 -> 按照('time')升序排列		
	   $engine = $m -> field("sum(is_del=0) AS status1")->where($where)->group("FROM_UNIXTIME(create_time,'%Y年%m月%d')") ->select();

	   
												
                     //var_dump($engine); order('create_time ASC')->
					//设置$data数组数据;
	   foreach($engine as $k=>$value)
		{
			$data .= $value[status1].",";
		}
		$data = substr($data, 0, -1);
		$this->assign('data',$data);
		
        $m = M('Task');//请将Test修改为你想要获取数据的表
					//解释一下数据的含义：field("求和所有的sale 作为 sum") -> 条件是($where) ->通过('time')分组 -> 按照('time')升序排列		
	    $engine = $m -> field("sum(is_del=0 and status=40) AS status2")->where($where)->group("FROM_UNIXTIME(create_time,'%Y年%m月%d')") ->select();
		
					
        //var_dump($engine);
					//设置$data数组数据;
	   foreach($engine as $k=>$value)
		{
			$data1 .= $value[status2].",";
		}
		$data1 = substr($data1, 0, -1);
		$this->assign('data1',$data1);

        $m = M('Task');//请将Test修改为你想要获取数据的表
					//解释一下数据的含义：field("求和所有的sale 作为 sum") -> 条件是($where) ->通过('time')分组 -> 按照('time')升序排列		
	    $engine = $m -> field("	sum(is_del=0 and status=30) AS status3")->where($where)->group("FROM_UNIXTIME(create_time,'%Y年%m月%d')") ->select();
												
                     //var_dump($engine);
					//设置$data数组数据;
	   foreach($engine as $k=>$value)
		{
			$data2 .= $value[status3].",";
		}
		$data2 = substr($data2, 0, -1);
		$this->assign('data2',$data2);


         $m = M('Task');//请将Test修改为你想要获取数据的表
					//解释一下数据的含义：field("求和所有的sale 作为 sum") -> 条件是($where) ->通过('time')分组 -> 按照('time')升序排列		
	    $engine = $m -> field("	sum(is_del=0 and status<30) AS status4")->where($where)->group("FROM_UNIXTIME(create_time,'%Y年%m月%d')") ->select();
												
                     //var_dump($engine);
					//设置$data数组数据;
	   foreach($engine as $k=>$value)
		{
			$data3 .= $value[status4].",";
		}
		$data3 = substr($data3, 0, -1);
		$this->assign('data3',$data3);

		

       $this -> display();
	}



}
