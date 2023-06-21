import maya.cmds as cmds

def load_plugins(*args, **kwargs):
    pluginList = ['mtoa',
                  # 'vrayformaya',
                  'fbxmaya',
                  'AbcImport',
                  'AbcExport','MayaScannerCB','MayaScanner']

    for eachPlugin in pluginList:
        if cmds.pluginInfo(eachPlugin , q=True, loaded=True) == False :
            try:
                cmds.loadPlugin(eachPlugin)
            except Exception as e:
                pass

def delayedStartup(*args, **kwargs):
    #cmds.colorManagementPrefs(e=True,cmEnabled=False)
    # cmds.colorManagementPrefs(e=True,cmEnabled=True)
    # cmds.modelEditor('modelPanel4', e=True, rnm='base_OpenGL_Renderer' )
    # cmds.modelEditor('modelPanel4', e=True, rnm='vp2Renderer' )
    #cmds.modelEditor ('modelPanel4', e=True,  udm= True)

    # https://qiita.com/aizwellenstan/items/2b1c286392fa9c8ae969
    cmds.currentUnit( time='film')
    
    # cmds.optionVar(sv =('preferredRenderer' ,'arnold'))
    cmds.playbackOptions(min = 1, ast =1, max =120, aet = 120)
    cmds.currentTime(1)
    # cmds.optionVar(iv=('renderSetupEnable', 0))
    # cmds.optionVar(iv=('refAnimCurvesEditable', 1))
    cmds.setAttr('defaultResolution.w', 1920)
    cmds.setAttr('defaultResolution.h', 1080)
    load_plugins()

maya.utils.executeDeferred('delayedStartup()') 