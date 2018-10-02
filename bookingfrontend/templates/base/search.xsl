<xsl:template match="data" xmlns:php="http://php.net/xsl">
   <div id="search-page-content">
    <div class="jumbotron jumbotron-fluid">
        <div class="container searchContainer">            
            <h2 class="text-center font-weight-bold">Bygg og lokaler til utleie</h2>
            
            <p class="text-center">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
            <div class="input-group input-group-lg">
                <input type="text" id="mainSearchInput" class="form-control searchInput" aria-label="Large" aria-describedby="inputGroup-sizing-sm" placeholder="Søk sted, hall, aktivitet, utstyr el"/>
                <div class="input-group-prepend">
                    <button class="input-group-text searchBtn" id="inputGroup-sizing-lg" type="button">
                        <i class="fas fa-search"></i>
                    </button>
                </div>
            </div>
            <div id="search-autocomplete"></div>
        </div>
        
    </div>
  
    <div class="container pageResults">
        
        <!-- FILTER BOXES> -->
        <div class="row" data-bind="if: filterboxes().length > 0">
            <div data-bind="foreach: filterboxes">
                    <div class="dropdown d-inline-block mr-2">
                        <button class="btn btn-secondary dropdown-toggle d-inline" data-bind="text: filterboxCaption" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            
                        </button>
                        <div class="dropdown-menu" data-bind="foreach: filterbox" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" data-bind="text: filterboxOption, id: filterboxOptionId, click: $root.filterboxSelected" href="#"></a>
                        </div>
                    </div>            
            </div>
        </div>

        <div class="row mt-3" data-bind="if: selectedFilterbox">
            <div class="dropdown d-inline-block" data-bind="if: activities().length > 0">
                <button class="btn btn-secondary dropdown-toggle d-inline mr-2" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      Aktiviteter      
                </button>
                <div class="dropdown-menu" data-bind="foreach: activities" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" data-bind="text: activityOption, id: activityOptionId, click: $root.activitySelected" href="#"></a>
                </div>
            </div>

            <div class="dropdown d-inline-block" data-bind="if: facilities().length > 0">
                <button class="btn btn-secondary dropdown-toggle d-inline mr-2" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      Fasiliteter      
                </button>
                <div class="dropdown-menu" data-bind="foreach: facilities" aria-labelledby="dropdownMenuButton">
                    <div class="dropdown-item d-block">
                        <a class="text-dark" data-bind="text: facilityOption, id: facilityOptionId, click: $root.facilitySelected" href="#"></a>
                        <span data-bind="if: selected">&#160; &#10004;</span>
                    </div>
                </div>
            </div>

            <div class="dropdown d-inline-block" data-bind="if: towns().length > 0">
                <button class="btn btn-secondary dropdown-toggle d-inline mr-2" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      Bydel      
                </button>
                <div class="dropdown-menu" data-bind="foreach: towns" aria-labelledby="dropdownMenuButton">
                    <div class="dropdown-item d-block">
                        <a class="text-dark" data-bind="text: townOption, id: townOptionId, click: $root.townSelected" href="#"></a>
                        <span data-bind="if: selected">&#160; &#10004;</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-5" data-bind="if: selectedTags().length > 0">
            <div data-bind="foreach: selectedTags">
            <div class="d-inline-block mb-2">
                <div class="tags">
                    <span data-bind="text: value, click: $root.clearTag" ></span>
                    <a href="" data-bind="click: $root.clearTag"><i class="fa fa-times tagsRemoveIcon" aria-hidden="true"></i></a></div>
                </div>
            </div>
        </div>

        <!-- UPCOMMING ARRAGEMENTS -->
        <div id="welcomeResult">
            <h1 class="text-center upcomingevents-header"></h1>

            <div class="row" data-bind="foreach: upcommingevents">
                <div class="col-lg-6 card-positioncorrect">
                    <a href="" class="custom-card-link">
                        <div class="row custom-card">
                            <div class="col-3 date-circle">
                                <svg width="90" height="90">
                                    <circle cx="45" cy="45" r="41" class="circle"/>
                                    <text class="event_datetime_day" data-bind="" x="50%" y="43%" text-anchor="middle" font-size="40px" fill="white" font-weight="bold" dy=".3em">                                        
                                    </text>
                                    <text data-bind="text: datetime_month" x="50%" y="68%" text-anchor="middle" fill="white" font-weight="bold" dy=".3em">                                        
                                    </text>
                                </svg>
                            </div>
                            <div class="col-8 desc">
                                <h5 class="font-weight-bold" data-bind="text: name"></h5>
                                <p data-bind="text: description"></p>
                                <span class="text-uppercase" data-bind="text: datetime_time"></span>
                                <span class="text-uppercase" data-bind="text: 'STED: ' +building_name"></span>
                                <span class="text-uppercase" data-bind="text: 'ARRANGØR: ' +organizer"></span>
                            </div>
                        </div>
                    </a>
                </div>
                
            </div>
        
        </div>
        
        <!-- SEARCH RESULT -->
        <div id="searchResult" data-bind="if: notFilterSearch">
            <h1 class="text-center result-title">Søkeresultat (<span data-bind="text: items().length"></span>)</h1>
           
            <div class="row" id="result-items" data-bind="foreach: items">
                <div class="col-lg-6 card-positioncorrect">
                    <a class="custom-card-link-href" data-bind="">
                        <div class="row custom-card">
                            <div class="col-3 date-circle">
                                <!--<img width="90" height="90" data-bind="" class="result-icon-image"/>-->
                                
                                <svg width="90" height="90">
                                    <circle cx="45" cy="45" r="37" class="circle" />
                                    <text x="50%" y="50%" text-anchor="middle" font-size="14px" fill="white" font-family="Arial" font-weight="bold" dy=".3em" data-bind="text: resultType">>
                                        
                                    </text>
                                    
                                </svg>
                                                               
                            </div>
                            <div class="col-8 desc">
                                <div class="desc">
                                    <h4 class="font-weight-bold" data-bind="text: name"></h4>
                                    <span data-bind="text: street"></span>
                                    <span class="d-block" data-bind="text: postcode"></span>
                                </div>
                                <div data-bind="foreach: tagItems">
                                    <span class="badge badge-pill badge-default text-uppercase" data-bind="text: $rawData, click: selectThisTag" ></span>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        
        </div>

        
        <!-- FILTER SEARCH RESULT -->
        <div id="filterSearchResult" data-bind="if: selectedFilterbox"> 
            <h1 class="text-center result-title">Søkeresultat (<span data-bind="text: filterSearchItems().length"></span>)</h1>
            <div data-bind="if: filterSearchItems().length > 0">
            
            <div class="row" data-bind="foreach: filterSearchItems">
                <div class="col-lg-6 card-positioncorrect">
                    <a class="custom-card-link-href" data-bind="">
                        <div class="row custom-card">
                            <div class="col-3 date-circle">
                                <!--<img width="90" height="90" data-bind="" class="result-icon-image"/>-->
                                
                                <svg width="90" height="90">
                                    <circle cx="45" cy="45" r="37" class="circle" />
                                    <text x="50%" y="50%" text-anchor="middle" font-size="14px" fill="white" font-family="Arial" font-weight="bold" dy=".3em" data-bind="text: resultType">>
                                        
                                    </text>
                                    
                                </svg>
                                                               
                            </div>
                            <div class="col-8 desc">
                                <h4 class="font-weight-bold" data-bind="text: name"></h4>
                                <span data-bind="text: street"></span>
                                <span class="d-block" data-bind="text: postcode"></span>
                            </div>

                        </div>
                        
                    </a>
                    
                    <div class="row custom-all-subcard" style="width: 100%" data-bind="foreach: filterSearchItemsResources">
                    
                        <div class="custom-subcard" data-bind="visible: $index() == 0 || $index() == 1">
                                    <div class="row">
                                        <div class="col-6">
                                            <h5 class="font-weight-bold" data-bind="text: name"></h5>
                                        </div>
                                        <div class="col-6">
                                            <a class="btn btn-light float-right filtersearch-bookBtn" data-bind="">Book</a>
                                        </div>
                                    </div>
                                    <div data-bind="foreach: facilities">
                                        <span class="tagTitle" data-bind="if: $index() == 0">Fasiliteter: </span>
                                        <span class="mr-2 textTagsItems" data-bind="text: name" ></span>
                                    </div>
                                    <div data-bind="foreach: activities">
                                    <span class="tagTitle" data-bind="if: $index() == 0">Aktiviteter: </span>
                                        <span class="mr-2 textTagsItems" data-bind="text: name" ></span>
                                    </div>
                        </div>                                
                    </div>
                    <div class="filterSearchToggle" data-bind="visible: filterSearchItemsResources().length > 2"><i class="fas fa-angle-down"></i> Se <span data-bind="text: (filterSearchItemsResources().length - 2) "></span> flere</div>

                </div>
            </div>
        
        </div>
        </div>
        
    </div>
    </div>      
          
      
        <script type="text/javascript">
            
            var script = document.createElement("script"); 
			script.src = strBaseURL.split('?')[0] + "bookingfrontend/js/base/search.js";
            document.head.appendChild(script);			
        </script>
  
</xsl:template>
