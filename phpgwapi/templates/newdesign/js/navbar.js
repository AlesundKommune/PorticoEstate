function initNavBar() {
	var state = navbar_config || {};

  	//var bl = new YAHOO.newdesign.BorderLayout('border-layout', border_layout_config );
	function clickHandler(e)
	{
		var elTarget = YAHOO.util.Event.getTarget(e);

		if(elTarget.nodeName.toUpperCase() == "IMG" && ( elTarget.className == 'expanded' || elTarget.className == 'collapsed' ) )
		{
			YAHOO.util.Event.preventDefault(e);

			// Should we expand or collapse ?
			var new_state = elTarget.className == 'expanded' ? 'collapsed' : 'expanded';

			// Change image
			elTarget.className = new_state;

			// Find the a element to find the item id
			while (elTarget.nodeName.toUpperCase() != "A")
			{
				elTarget = elTarget.parentNode;
			}
			var id = elTarget.id;

			// Find the list element and do the actuall expand
			while (elTarget.nodeName.toUpperCase() != "LI")
			{
				elTarget = elTarget.parentNode;
			}

			elTarget.className = new_state;

			if(elTarget.className ==  'expanded')
			{
				state[id] = elTarget.className;
				store('navbar_config', state);
			}
			else if( state[id] )
			{
				delete state[id];
				store('navbar_config', state);
			}
		}

	}
	YAHOO.util.Event.on("navbar", "click", clickHandler);
}

YAHOO.util.Event.onDOMReady(initNavBar);