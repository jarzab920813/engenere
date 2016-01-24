# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# 

jQuery ->
  $('#vehicles').dataTable
    sPaginationType: "full_numbers"
    bJQueryUI: true
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#vehicles').data('source')
    'language':
	    'processing':   'Przetwarzanie...'
	    'lengthMenu':   'Pokaż _MENU_ pozycji'
	    'zeroRecords':  'Nie znaleziono pasujących pozycji'
	    'infoThousands':  '' 
	    'info':         'Pozycje od _START_ do _END_ z _TOTAL_ łącznie'
	    'infoEmpty':    'Pozycji 0 z 0 dostępnych'
	    'infoFiltered': '(filtrowanie spośród _MAX_ dostępnych pozycji)'
	    'infoPostFix':  ''
	    'search':       'Szukaj:'
	    'url':          ''
	    'paginate': {
	        'first':    'Pierwsza'
	        'previous': 'Poprzednia'
	        'next':     'Następna'
	        'last':     'Ostatnia'
	    }
	    'emptyTable':     'Brak danych'
	    'loadingRecords': 'Wczytywanie...'
	    'aria': {
	        'sortAscending':  ': aktywuj, by posortować kolumnę rosnąco'
	        'sortDescending': ': aktywuj, by posortować kolumnę malejąco'
	    }

  $('#events1').dataTable
    sPaginationType: "full_numbers"
    bJQueryUI: true
    bProcessing: true
    bServerSide: true
    aoColumnDefs: [
      { bSortable: false, aTargets: [ 0, -2 ] }
    ],
    sAjaxSource: $('#events1').data('source')
    'language':
	    'processing':   'Przetwarzanie...'
	    'lengthMenu':   'Pokaż _MENU_ pozycji'
	    'zeroRecords':  'Nie znaleziono pasujących pozycji'
	    'infoThousands':  '' 
	    'info':         'Pozycje od _START_ do _END_ z _TOTAL_ łącznie'
	    'infoEmpty':    'Pozycji 0 z 0 dostępnych'
	    'infoFiltered': '(filtrowanie spośród _MAX_ dostępnych pozycji)'
	    'infoPostFix':  ''
	    'search':       'Szukaj:'
	    'url':          ''
	    'paginate': {
	        'first':    'Pierwsza'
	        'previous': 'Poprzednia'
	        'next':     'Następna'
	        'last':     'Ostatnia'
	    }
	    'emptyTable':     'Brak danych'
	    'loadingRecords': 'Wczytywanie...'
	    'aria': {
	        'sortAscending':  ': aktywuj, by posortować kolumnę rosnąco'
	        'sortDescending': ': aktywuj, by posortować kolumnę malejąco'
	    }

  $('#documents').dataTable
    sPaginationType: "full_numbers"
    bJQueryUI: true
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#documents').data('source')
    'language':
	    'processing':   'Przetwarzanie...'
	    'lengthMenu':   'Pokaż _MENU_ pozycji'
	    'zeroRecords':  'Nie znaleziono pasujących pozycji'
	    'infoThousands':  '' 
	    'info':         'Pozycje od _START_ do _END_ z _TOTAL_ łącznie'
	    'infoEmpty':    'Pozycji 0 z 0 dostępnych'
	    'infoFiltered': '(filtrowanie spośród _MAX_ dostępnych pozycji)'
	    'infoPostFix':  ''
	    'search':       'Szukaj:'
	    'url':          ''
	    'paginate': {
	        'first':    'Pierwsza'
	        'previous': 'Poprzednia'
	        'next':     'Następna'
	        'last':     'Ostatnia'
	    }
	    'emptyTable':     'Brak danych'
	    'loadingRecords': 'Wczytywanie...'
	    'aria': {
	        'sortAscending':  ': aktywuj, by posortować kolumnę rosnąco'
	        'sortDescending': ': aktywuj, by posortować kolumnę malejąco'
	    }