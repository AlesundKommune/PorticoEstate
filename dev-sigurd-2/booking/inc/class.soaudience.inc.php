<?php
	phpgw::import_class('booking.socommon');
	
	class booking_soaudience extends booking_socommon
	{
		function __construct()
		{
			parent::__construct('bb_targetaudience', 
				array(
					'id'			=> 	array(	'type'		=> 'int'),
					'name' 			=> 	array(	'type'		=> 'string',
												'query' 	=> true,
												'required' 	=> true ),
					'description'	=> 	array(	'type'		=> 'string',
												'query' 	=> true,
												'required' 	=> false),
					'active'		=> 	array(	'type'		=> 'int')
				)
			);
			$this->account		= $GLOBALS['phpgw_info']['user']['account_id'];
		}
		
		function set_active_session()
		{
			$this->so->set_active_session();
		}

		function unset_active_session()
		{
			$this->so->unset_active_session();
		}
	}
