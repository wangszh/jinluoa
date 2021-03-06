<?php
/*--------------------------------------------------------------------
 小微OA系统 - 让工作更轻松快乐

 Copyright (c) 2013 http://www.smeoa.com All rights reserved.

 Author:  jinzhu.yin<smeoa@qq.com>

 Support: https://git.oschina.net/smeoa/xiaowei
 --------------------------------------------------------------*/

namespace Home\Controller;

class DeptController extends HomeController {

	protected $config = array('app_type' => 'master');

	public function index() {



		$node = M("Dept");
		$menu = array();

        //新增所属企业
		if(session('company_id')==1) {
			
            $menu = $node  -> field('id,pid,name,is_del,company_id') -> order('sort asc') -> select();
			$tree = list_to_tree($menu);

		}else {

            $where['company_id']=session('company_id');

			$menu = $node  -> where($where) ->field('id,pid,name,is_del,company_id') -> order('sort asc') -> select();
			$tree = list_to_tree1($menu);

            //var_dump($menu);
			//

		}
		
      
	    //$where['id']=array('not in','1,30');

		
		
		$this -> assign('menu', popup_tree_menu($tree));

		$model = M("Dept");

		
        if(session('company_id')==1){

			$list = $model -> order('sort asc') -> getField('id,name');
			
		}else{
			$where['company_id']=session('company_id');

			$list = $model -> where($where) ->order('sort asc') -> getField('id,name');

		}

		

		//echo $list;

		$this -> assign('dept_list', $list);

		$model = M("DeptGrade");
		$list = $model -> where('is_del=0') -> order('sort asc') -> getField('id,name');


		$this->ajaxReturn($list,'JSON');
		//$this -> assign('dept_grade_list', $list);

        


		//$this -> display();
		
	}

	

	public function add() {
		$model = M("DeptGrade");
		$list = $model -> where('is_del=0') -> order('sort asc') -> getField('id,name');
		$this -> assign('dept_grade_list', $list);



		$this -> display();
	}

	public function del($id) {
		$this -> _destory($id);
	}
   
    
    
	public function _insert($name = "Dept") {

        // 创建数据对象
		$model = M("Dept");
		if (!$model -> create()) {
			$this -> error($model -> getError());
		} else {
			// 写入部门数据

			$where["id"]=$_POST['pid'];
           
			if($_POST['pid']=='1' || $_POST['pid']=='0') {

              $company_id=$model ->where($where) ->getField('id');
    
			}else {

              $company_id=$model ->where($where) ->getField('company_id');
			}

			

            $model -> company_id =$company_id;

			
			if ($result = $model -> add()) {

				$this -> assign('jumpUrl', get_return_url());
				$this -> success('部门添加成功！');
				
			} else {
				$this -> error('部门添加失败！');
			}
		}
	

	}

    
   protected function _update($name = "Dept") {
		$model = D($name);
		if (false === $model -> create()) {
			$this -> error($model -> getError());
		}
		// 更新数据
        $where["id"]=$_POST['pid'];
           
		if($_POST['pid']=='1' || $_POST['pid']=='0') {

              $company_id=$model ->where($where) ->getField('id');
    
		}else {

              $company_id=$model ->where($where) ->getField('company_id');
		}

			

        $model -> company_id =$company_id;



		$list = $model -> save();

		if (false !== $list) {
			
			$this -> assign('jumpUrl', get_return_url());
			$this -> success('编辑成功!');
			//var_dump("aaa");
		} else {
			//错误提示
			$this -> error('编辑失败!');
		}
	}


	public function winpop() {
		$node = M("Dept");
		$menu = array();

        //新增所属企业

		if(session('company_id')==1) {

			$where['is_del']=0;
            $menu = $node -> where($where) -> field('id,pid,name,company_id') -> order('sort asc') -> select();
            $tree = list_to_tree($menu);

		}else{

			$where['is_del']=0;
			$where['company_id']=session('company_id');
            $menu = $node -> where($where) -> field('id,pid,name,company_id') -> order('sort asc') -> select();
			$tree = list_to_tree1($menu);

		}

		//$where['is_del']=0;
        //$menu = $node -> where($where) -> field('id,pid,name,company_id') -> order('sort asc') -> select();

		//$menu = $node -> where('is_del=0') -> field('id,pid,name') -> order('sort asc') -> select();

		
		$this -> assign('menu', popup_tree_menu($tree));
		$pid = array();
		$this -> assign('pid', $pid);

		//var_dump($pid);

        //$qid=getqid('6');

		//var_dump($qid[0]['pid']);

		//$this -> assign('qid', $qid[0]['pid']);
      
       

		
		$this -> display();
	}

	public function winpop2() {
		$this -> winpop();
	}
    

	
  
}
?>