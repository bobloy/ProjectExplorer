*==============================================================================
define class ProjectExplorerFormMenu as ProjectExplorerMenu ;
	of ProjectExplorerMenu.vcx
*==============================================================================
	procedure DefineMenu
		with This
			.AddPad('FilePad', 'ProjectExplorerMenu.prg', 'FilePad')
			.AddPad('EditPad', 'ProjectExplorerMenu.prg', 'EditPad')
			.AddPad('HelpPad', 'ProjectExplorerMenu.prg', 'HelpPad')
		endwith
	endproc
enddefine

*==============================================================================
define class FilePad as ProjectExplorerPad of ProjectExplorerMenu.vcx
*==============================================================================
	cCaption       = [\<File]
	cKey           = [ALT+F]
	cStatusBarText = [File operations]

	procedure AddBars
		with This
			.AddBar('FileAddProject',         'ProjectExplorerMenu.prg', ;
				'FileAddProject')
			.AddBar('FileRemoveProject',      'ProjectExplorerMenu.prg', ;
				'FileRemoveProject')
			.AddSeparatorBar()
			.AddBar('FileCleanupSolution',    'ProjectExplorerMenu.prg', ;
				'FileCleanupSolution')
			.AddBar('FileSolutionProperties', 'ProjectExplorerMenu.prg', ;
				'FileSolutionProperties')
			.AddSeparatorBar()
			.AddBar('FileSortFilter',         'ProjectExplorerMenu.prg', ;
				'FileSortFilter')
			.AddSeparatorBar()
			.AddBar('FileTagEditor',          'ProjectExplorerMenu.prg', ;
				'FileTagEditor')
			.AddBar('FileCategoryEditor',     'ProjectExplorerMenu.prg', ;
				'FileCategoryEditor')
			.AddBar('FileOptions',            'ProjectExplorerMenu.prg', ;
				'FileOptions')
			.AddSeparatorBar()
			.AddBar('FileExit',               'ProjectExplorerMenu.prg', ;
				'FileExit')
		endwith
	endproc
enddefine

*==============================================================================
define class FileAddProject as ProjectExplorerBar of ProjectExplorerMenu.vcx
*==============================================================================
	cCaption          = [\<Add Project to Solution]
	cKey              = []
	cKeyText          = []
	cStatusBarText    = [Adds a project to the solution]
	cOnClickCommand   = []
	cActiveFormMethod = [AddProjectToSolution]
	cSkipFor          = []
	cPictureResource  = []
	cPictureFile      = [add.bmp]
	cSystemBar        = []
enddefine

*==============================================================================
define class FileRemoveProject as ProjectExplorerBar of ProjectExplorerMenu.vcx
*==============================================================================
	cCaption          = [\<Remove Project from Solution]
	cKey              = []
	cKeyText          = []
	cStatusBarText    = [Removes a project from the solution]
	cOnClickCommand   = []
	cActiveFormMethod = [RemoveProjectFromSolution]
	cSkipFor          = [_screen.ActiveForm.oSolution.oProjects.Count < 2 or vartype(_screen.ActiveForm.oItem) = 'O']
		&& skip if there's only one project or a project isn't selected
	cPictureResource  = []
	cPictureFile      = [remove.bmp]
	cSystemBar        = []
enddefine

*==============================================================================
define class FileCleanupSolution as ProjectExplorerBar ;
	of ProjectExplorerMenu.vcx
*==============================================================================
	cCaption          = [\<Cleanup Solution]
	cKey              = []
	cKeyText          = []
	cStatusBarText    = [Cleans up all projects in the solution]
	cOnClickCommand   = []
	cActiveFormMethod = [CleanupSolution]
	cSkipFor          = []
	cPictureResource  = []
	cPictureFile      = [Cleanup.bmp]
	cSystemBar        = []
enddefine

*==============================================================================
define class FileSolutionProperties as ProjectExplorerBar ;
	of ProjectExplorerMenu.vcx
*==============================================================================
	cCaption          = [\<Version Control Properties...]
	cKey              = []
	cKeyText          = []
	cStatusBarText    = [Maintains version control properties for the solution]
	cOnClickCommand   = []
	cActiveFormMethod = [EditSolutionProperties]
	cSkipFor          = []
	cPictureResource  = []
	cPictureFile      = [ProjectExplorer.ico]
	cSystemBar        = []
enddefine

*==============================================================================
define class FileSortFilter as ProjectExplorerBar of ProjectExplorerMenu.vcx
*==============================================================================
	cCaption          = [\<Sort and Filter...]
	cKey              = []
	cKeyText          = []
	cStatusBarText    = [Allows you to specify how to sort and filter the TreeView]
	cOnClickCommand   = []
	cActiveFormMethod = [SortFilter]
	cSkipFor          = []
	cPictureResource  = []
	cPictureFile      = [Filter.ico]
	cSystemBar        = []
enddefine

*==============================================================================
define class FileTagEditor as ProjectExplorerBar of ProjectExplorerMenu.vcx
*==============================================================================
	cCaption          = [\<Tag Editor]
	cKey              = []
	cKeyText          = []
	cStatusBarText    = [Maintain tags]
	cOnClickCommand   = []
	cActiveFormMethod = [EditTags]
	cSkipFor          = []
	cPictureResource  = []
	cPictureFile      = [Tags.ico]
	cSystemBar        = []
enddefine

*==============================================================================
define class FileCategoryEditor as ProjectExplorerBar ;
	of ProjectExplorerMenu.vcx
*==============================================================================
	cCaption          = [\<Category Editor]
	cKey              = []
	cKeyText          = []
	cStatusBarText    = [Maintain categories]
	cOnClickCommand   = []
	cActiveFormMethod = [EditCategories]
	cSkipFor          = []
	cPictureResource  = []
	cPictureFile      = [Category.ico]
	cSystemBar        = []
enddefine

*==============================================================================
define class FileOptions as ProjectExplorerBar of ProjectExplorerMenu.vcx
*==============================================================================
	cCaption          = [\<Options...]
	cKey              = []
	cKeyText          = []
	cStatusBarText    = [Maintain Project Explorer options]
	cOnClickCommand   = []
	cActiveFormMethod = [GetOptions]
	cSkipFor          = []
	cPictureResource  = []
	cPictureFile      = [options.bmp]
	cSystemBar        = []
enddefine

*==============================================================================
define class FileExit as ProjectExplorerBar of ProjectExplorerMenu.vcx
*==============================================================================
	cCaption          = [E\<xit]
	cKey              = []
	cKeyText          = []
	cStatusBarText    = [Exits Project Explorer]
	cOnClickCommand   = []
	cActiveFormMethod = [Release]
	cSkipFor          = []
	cPictureResource  = [_mfi_quit]
	cPictureFile      = []
	cSystemBar        = []
enddefine

*==============================================================================
define class EditPad as ProjectExplorerPad of ProjectExplorerMenu.vcx
*==============================================================================
	cCaption       = [\<Edit]
	cKey           = [ALT+E]
	cStatusBarText = [Edits text or current selection]

	procedure AddBars
		with This
			.AddBar('EditUndo',      'ProjectExplorerMenu.prg', 'EditUndo')
			.AddBar('EditRedo',      'ProjectExplorerMenu.prg', 'EditRedo')
			.AddSeparatorBar()
			.AddBar('EditCut',       'ProjectExplorerMenu.prg', 'EditCut')
			.AddBar('EditCopy',      'ProjectExplorerMenu.prg', 'EditCopy')
			.AddBar('EditPaste',     'ProjectExplorerMenu.prg', 'EditPaste')
			.AddBar('EditClear',     'ProjectExplorerMenu.prg', 'EditClear')
			.AddSeparatorBar()
			.AddBar('EditSelectAll', 'ProjectExplorerMenu.prg', ;
				'EditSelectAll')
		endwith
	endproc
enddefine

*==============================================================================
define class EditUndo as ProjectExplorerBar of ProjectExplorerMenu.vcx
*==============================================================================
	cCaption         = [\<Undo]
	cKey             = [CTRL+Z]
	cKeyText         = [Ctrl+Z]
	cStatusBarText   = [Undoes the last command or action]
	cOnClickCommand  = []
	cSkipFor         = []
	cPictureResource = []
	cPictureFile     = [UndoXPSmall.bmp]
	cSystemBar       = [_med_undo]
enddefine

*==============================================================================
define class EditRedo as ProjectExplorerBar of ProjectExplorerMenu.vcx
*==============================================================================
	cCaption         = [Re\<do]
	cKey             = [CTRL+R]
	cKeyText         = [Ctrl+R]
	cStatusBarText   = [Repeats the last command or action]
	cOnClickCommand  = []
	cSkipFor         = []
	cPictureResource = []
	cPictureFile     = [RedoXPSmall.bmp]
	cSystemBar       = [_med_redo]
enddefine

*==============================================================================
define class EditCut as ProjectExplorerBar of ProjectExplorerMenu.vcx
*==============================================================================
	cCaption         = [Cu\<t]
	cKey             = [CTRL+X]
	cKeyText         = [Ctrl+X]
	cStatusBarText   = [Removes the selection and places it onto the Clipboard]
	cOnClickCommand  = []
	cSkipFor         = []
	cPictureResource = []
	cPictureFile     = [cutxpsmall.bmp]
	cSystemBar       = [_med_cut]
enddefine

*==============================================================================
define class EditCopy as ProjectExplorerBar of ProjectExplorerMenu.vcx
*==============================================================================
	cCaption         = [\<Copy]
	cKey             = [CTRL+C]
	cKeyText         = [Ctrl+C]
	cStatusBarText   = [Copies the selection onto the Clipboard]
	cOnClickCommand  = []
	cSkipFor         = []
	cPictureResource = []
	cPictureFile     = [copyxpsmall.bmp]
	cSystemBar       = [_med_copy]
enddefine

*==============================================================================
define class EditPaste as ProjectExplorerBar of ProjectExplorerMenu.vcx
*==============================================================================
	cCaption         = [\<Paste]
	cKey             = [CTRL+V]
	cKeyText         = [Ctrl+V]
	cStatusBarText   = [Pastes the contents of the Clipboard]
	cOnClickCommand  = []
	cSkipFor         = []
	cPictureResource = []
	cPictureFile     = [pastexpsmall.bmp]
	cSystemBar       = [_med_paste]
enddefine

*==============================================================================
define class EditClear as ProjectExplorerBar of ProjectExplorerMenu.vcx
*==============================================================================
	cCaption         = [Cle\<ar]
	cKey             = []
	cKeyText         = []
	cStatusBarText   = [Removes the selection and does not place it onto the Clipboard]
	cOnClickCommand  = []
	cSkipFor         = []
	cPictureResource = [_med_clear]
	cPictureFile     = []
	cSystemBar       = [_med_clear]
enddefine

*==============================================================================
define class EditSelectAll as ProjectExplorerBar of ProjectExplorerMenu.vcx
*==============================================================================
	cCaption         = [Se\<lect All]
	cKey             = [CTRL+A]
	cKeyText         = [Ctrl+A]
	cStatusBarText   = [Selects all text or items in the current window]
	cOnClickCommand  = []
	cSkipFor         = []
	cPictureResource = [_med_slcta]
	cPictureFile     = []
	cSystemBar       = [_med_slcta]
enddefine

*==============================================================================
define class HelpPad as ProjectExplorerPad of ProjectExplorerMenu.vcx
*==============================================================================
	cCaption       = [\<Help]
	cKey           = [ALT+H]
	cStatusBarText = [Displays Help]

	procedure AddBars
		with This
*** TODO: have help file?
			.AddBar('ProjectExplorerHelpTopicsBar', 'ProjectExplorerMenu.vcx', ;
				'HelpHelp')
			.AddBar('HelpAboutProjectExplorer', 'ProjectExplorerMenu.prg', ;
				'HelpAboutProjectExplorer')
		endwith
	endproc
enddefine

*==============================================================================
define class HelpAboutProjectExplorer as ProjectExplorerBar ;
	of ProjectExplorerMenu.vcx
*==============================================================================
	cCaption         = [\<About Project Explorer...]
	cKey             = []
	cKeyText         = []
	cStatusBarText   = [Displays information about Project Explorer]
	cOnClickCommand  = [do form About]
	cSkipFor         = []
	cPictureResource = [_mst_about]
	cPictureFile     = []
	cSystemBar       = []
enddefine