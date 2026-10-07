.class public Lio/mrarm/mcpelauncher/ErrorActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "ErrorActivity.java"


# static fields
.field private static final PERMISSION_REQUEST_ID:I = 0x1

.field private static final PICK_MCPE_APK_ID:I = 0x99


# instance fields
.field private requestedPermission:Ljava/lang/String;

.field private requestedPermissionName:Ljava/lang/String;

.field private requiredFiles:[Ljava/lang/String;

.field private returnClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private skippable:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 36
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    .line 43
    const/4 v0, 0x0

    iput-object v0, p0, Lio/mrarm/mcpelauncher/ErrorActivity;->skippable:Ljava/lang/String;

    .line 257
    const/16 v0, 0x53a

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "shaders/texture.fragment"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "shaders/weather.fragment"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "shaders/uv_scale.vertex"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "shaders/uniforms.json"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "shaders/rain_snow.fragment"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "shaders/color_texture.fragment"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "shaders/renderchunk.fragment"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "shaders/iteminhand.fragment"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "shaders/hologram_sr.fragment"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "shaders/holoroom_inner_skirt.fragment"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "shaders/holoroom_terrain_endcap.vertex"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "shaders/entity.fragment"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "shaders/color.fragment"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "shaders/color.vertex"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "shaders/color_ex.fragment"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "shaders/holoroom_terrain_endcap.fragment"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string v2, "shaders/texture_ccolor.fragment"

    aput-object v2, v0, v1

    const/16 v1, 0x11

    const-string v2, "shaders/uv_as_color.fragment"

    aput-object v2, v0, v1

    const/16 v1, 0x12

    const-string v2, "shaders/text.fragment"

    aput-object v2, v0, v1

    const/16 v1, 0x13

    const-string v2, "shaders/entity.vertex"

    aput-object v2, v0, v1

    const/16 v1, 0x14

    const-string v2, "shaders/normal_as_color.vertex"

    aput-object v2, v0, v1

    const/16 v1, 0x15

    const-string v2, "shaders/position.vertex"

    aput-object v2, v0, v1

    const/16 v1, 0x16

    const-string v2, "shaders/current_color.fragment"

    aput-object v2, v0, v1

    const/16 v1, 0x17

    const-string v2, "shaders/texture_cutout.fragment"

    aput-object v2, v0, v1

    const/16 v1, 0x18

    const-string v2, "shaders/sky.vertex"

    aput-object v2, v0, v1

    const/16 v1, 0x19

    const-string v2, "shaders/holoroom_inner_skirt.vertex"

    aput-object v2, v0, v1

    const/16 v1, 0x1a

    const-string v2, "shaders/hologram_sr.vertex"

    aput-object v2, v0, v1

    const/16 v1, 0x1b

    const-string v2, "shaders/color_uv.vertex"

    aput-object v2, v0, v1

    const/16 v1, 0x1c

    const-string v2, "shaders/weather.vertex"

    aput-object v2, v0, v1

    const/16 v1, 0x1d

    const-string v2, "shaders/renderchunk.vertex"

    aput-object v2, v0, v1

    const/16 v1, 0x1e

    const-string v2, "shaders/cloud.vertex"

    aput-object v2, v0, v1

    const/16 v1, 0x1f

    const-string v2, "shaders/rain_snow.vertex"

    aput-object v2, v0, v1

    const/16 v1, 0x20

    const-string v2, "shaders/holoroom_tableSurface.fragment"

    aput-object v2, v0, v1

    const/16 v1, 0x21

    const-string v2, "shaders/flat_white.fragment"

    aput-object v2, v0, v1

    const/16 v1, 0x22

    const-string v2, "shaders/holoroom_tableSurface.vertex"

    aput-object v2, v0, v1

    const/16 v1, 0x23

    const-string v2, "shaders/hologram_texture_stereo.fragment"

    aput-object v2, v0, v1

    const/16 v1, 0x24

    const-string v2, "shaders/uv.vertex"

    aput-object v2, v0, v1

    const/16 v1, 0x25

    const-string v2, "splashes.json"

    aput-object v2, v0, v1

    const/16 v1, 0x26

    const-string v2, "items.json"

    aput-object v2, v0, v1

    const/16 v1, 0x27

    const-string v2, "materials/fancy.json"

    aput-object v2, v0, v1

    const/16 v1, 0x28

    const-string v2, "materials/terrain.material"

    aput-object v2, v0, v1

    const/16 v1, 0x29

    const-string v2, "materials/fancy.material"

    aput-object v2, v0, v1

    const/16 v1, 0x2a

    const-string v2, "materials/common.json"

    aput-object v2, v0, v1

    const/16 v1, 0x2b

    const-string v2, "materials/ui3D.material"

    aput-object v2, v0, v1

    const/16 v1, 0x2c

    const-string v2, "materials/sky.material"

    aput-object v2, v0, v1

    const/16 v1, 0x2d

    const-string v2, "materials/particles.material"

    aput-object v2, v0, v1

    const/16 v1, 0x2e

    const-string v2, "materials/ui.material"

    aput-object v2, v0, v1

    const/16 v1, 0x2f

    const-string v2, "materials/entity.material"

    aput-object v2, v0, v1

    const/16 v1, 0x30

    const-string v2, "materials/sad.json"

    aput-object v2, v0, v1

    const/16 v1, 0x31

    const-string v2, "materials/shadows.material"

    aput-object v2, v0, v1

    const/16 v1, 0x32

    const-string v2, "materials/sad.material"

    aput-object v2, v0, v1

    const/16 v1, 0x33

    const-string v2, "ui/inventory_screen.json"

    aput-object v2, v0, v1

    const/16 v1, 0x34

    const-string v2, "ui/redstone_screen.json"

    aput-object v2, v0, v1

    const/16 v1, 0x35

    const-string v2, "ui/trial_upsell_screen.json"

    aput-object v2, v0, v1

    const/16 v1, 0x36

    const-string v2, "ui/gamepad_layout_screen.json"

    aput-object v2, v0, v1

    const/16 v1, 0x37

    const-string v2, "ui/ui_common.json"

    aput-object v2, v0, v1

    const/16 v1, 0x38

    const-string v2, "ui/test_anims_screen.json"

    aput-object v2, v0, v1

    const/16 v1, 0x39

    const-string v2, "ui/start_screen.json"

    aput-object v2, v0, v1

    const/16 v1, 0x3a

    const-string v2, "ui/language_choice_screen.json"

    aput-object v2, v0, v1

    const/16 v1, 0x3b

    const-string v2, "ui/_ui_defs.json"

    aput-object v2, v0, v1

    const/16 v1, 0x3c

    const-string v2, "ui/chest_screen.json"

    aput-object v2, v0, v1

    const/16 v1, 0x3d

    const-string v2, "ui/xbl_login_screen.json"

    aput-object v2, v0, v1

    const/16 v1, 0x3e

    const-string v2, "ui/ui_common_classic.json"

    aput-object v2, v0, v1

    const/16 v1, 0x3f

    const-string v2, "ui/pause_screen_trial.json"

    aput-object v2, v0, v1

    const/16 v1, 0x40

    const-string v2, "ui/furnace_screen.json"

    aput-object v2, v0, v1

    const/16 v1, 0x41

    const-string v2, "ui/play_screen.json"

    aput-object v2, v0, v1

    const/16 v1, 0x42

    const-string v2, "ui/enchanting_screen.json"

    aput-object v2, v0, v1

    const/16 v1, 0x43

    const-string v2, "ui/pocket_redstone.json"

    aput-object v2, v0, v1

    const/16 v1, 0x44

    const-string v2, "ui/brewing_stand_screen.json"

    aput-object v2, v0, v1

    const/16 v1, 0x45

    const-string v2, "ui/anvil_screen.json"

    aput-object v2, v0, v1

    const/16 v1, 0x46

    const-string v2, "sounds/mob/villager/hit2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x47

    const-string v2, "sounds/mob/villager/hit4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x48

    const-string v2, "sounds/mob/villager/idle1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x49

    const-string v2, "sounds/mob/villager/idle2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x4a

    const-string v2, "sounds/mob/villager/hit3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x4b

    const-string v2, "sounds/mob/villager/hit1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x4c

    const-string v2, "sounds/mob/villager/idle3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x4d

    const-string v2, "sounds/mob/villager/death.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x4e

    const-string v2, "sounds/mob/irongolem/hit2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x4f

    const-string v2, "sounds/mob/irongolem/throw.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x50

    const-string v2, "sounds/mob/irongolem/hit4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x51

    const-string v2, "sounds/mob/irongolem/hit3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x52

    const-string v2, "sounds/mob/irongolem/walk2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x53

    const-string v2, "sounds/mob/irongolem/hit1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x54

    const-string v2, "sounds/mob/irongolem/walk1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x55

    const-string v2, "sounds/mob/irongolem/walk4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x56

    const-string v2, "sounds/mob/irongolem/walk3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x57

    const-string v2, "sounds/mob/irongolem/death.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x58

    const-string v2, "sounds/mob/bat/idle1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x59

    const-string v2, "sounds/mob/bat/hurt4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x5a

    const-string v2, "sounds/mob/bat/idle2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x5b

    const-string v2, "sounds/mob/bat/idle4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x5c

    const-string v2, "sounds/mob/bat/hurt1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x5d

    const-string v2, "sounds/mob/bat/hurt2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x5e

    const-string v2, "sounds/mob/bat/takeoff.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x5f

    const-string v2, "sounds/mob/bat/idle3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x60

    const-string v2, "sounds/mob/bat/hurt3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x61

    const-string v2, "sounds/mob/bat/death.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x62

    const-string v2, "sounds/mob/cat/purreow1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x63

    const-string v2, "sounds/mob/cat/meow1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x64

    const-string v2, "sounds/mob/cat/meow3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x65

    const-string v2, "sounds/mob/cat/purr3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x66

    const-string v2, "sounds/mob/cat/hitt2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x67

    const-string v2, "sounds/mob/cat/purreow2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x68

    const-string v2, "sounds/mob/cat/meow4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x69

    const-string v2, "sounds/mob/cat/hiss1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x6a

    const-string v2, "sounds/mob/cat/purr2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x6b

    const-string v2, "sounds/mob/cat/hitt1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x6c

    const-string v2, "sounds/mob/cat/meow2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x6d

    const-string v2, "sounds/mob/cat/hiss3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x6e

    const-string v2, "sounds/mob/cat/purr1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x6f

    const-string v2, "sounds/mob/cat/hiss2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x70

    const-string v2, "sounds/mob/cat/hitt3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x71

    const-string v2, "sounds/mob/skeleton/step2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x72

    const-string v2, "sounds/mob/skeleton/hurt4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x73

    const-string v2, "sounds/mob/skeleton/say1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x74

    const-string v2, "sounds/mob/skeleton/hurt1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x75

    const-string v2, "sounds/mob/skeleton/step4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x76

    const-string v2, "sounds/mob/skeleton/step3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x77

    const-string v2, "sounds/mob/skeleton/say2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x78

    const-string v2, "sounds/mob/skeleton/say3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x79

    const-string v2, "sounds/mob/skeleton/step1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x7a

    const-string v2, "sounds/mob/skeleton/hurt2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x7b

    const-string v2, "sounds/mob/skeleton/hurt3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x7c

    const-string v2, "sounds/mob/skeleton/death.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x7d

    const-string v2, "sounds/mob/silverfish/hit2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x7e

    const-string v2, "sounds/mob/silverfish/step2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x7f

    const-string v2, "sounds/mob/silverfish/kill.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x80

    const-string v2, "sounds/mob/silverfish/hit3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x81

    const-string v2, "sounds/mob/silverfish/say1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x82

    const-string v2, "sounds/mob/silverfish/hit1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x83

    const-string v2, "sounds/mob/silverfish/step4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x84

    const-string v2, "sounds/mob/silverfish/step3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x85

    const-string v2, "sounds/mob/silverfish/say2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x86

    const-string v2, "sounds/mob/silverfish/say3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x87

    const-string v2, "sounds/mob/silverfish/step1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x88

    const-string v2, "sounds/mob/silverfish/say4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x89

    const-string v2, "sounds/mob/wolf/bark2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x8a

    const-string v2, "sounds/mob/wolf/step2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x8b

    const-string v2, "sounds/mob/wolf/step5.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x8c

    const-string v2, "sounds/mob/wolf/growl2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x8d

    const-string v2, "sounds/mob/wolf/growl3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x8e

    const-string v2, "sounds/mob/wolf/growl1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x8f

    const-string v2, "sounds/mob/wolf/hurt1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x90

    const-string v2, "sounds/mob/wolf/bark1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x91

    const-string v2, "sounds/mob/wolf/step4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x92

    const-string v2, "sounds/mob/wolf/step3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x93

    const-string v2, "sounds/mob/wolf/panting.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x94

    const-string v2, "sounds/mob/wolf/step1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x95

    const-string v2, "sounds/mob/wolf/hurt2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x96

    const-string v2, "sounds/mob/wolf/shake.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x97

    const-string v2, "sounds/mob/wolf/bark3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x98

    const-string v2, "sounds/mob/wolf/whine.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x99

    const-string v2, "sounds/mob/wolf/hurt3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x9a

    const-string v2, "sounds/mob/wolf/death.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x9b

    const-string v2, "sounds/mob/cow/step2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x9c

    const-string v2, "sounds/mob/cow/say1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x9d

    const-string v2, "sounds/mob/cow/hurt1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x9e

    const-string v2, "sounds/mob/cow/step4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x9f

    const-string v2, "sounds/mob/cow/step3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xa0

    const-string v2, "sounds/mob/cow/say2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xa1

    const-string v2, "sounds/mob/cow/say3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xa2

    const-string v2, "sounds/mob/cow/step1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xa3

    const-string v2, "sounds/mob/cow/hurt2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xa4

    const-string v2, "sounds/mob/cow/say4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xa5

    const-string v2, "sounds/mob/cow/hurt3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xa6

    const-string v2, "sounds/mob/chicken/step2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xa7

    const-string v2, "sounds/mob/chicken/say1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xa8

    const-string v2, "sounds/mob/chicken/hurt1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xa9

    const-string v2, "sounds/mob/chicken/say2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xaa

    const-string v2, "sounds/mob/chicken/say3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xab

    const-string v2, "sounds/mob/chicken/step1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xac

    const-string v2, "sounds/mob/chicken/hurt2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xad

    const-string v2, "sounds/mob/chicken/plop.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xae

    const-string v2, "sounds/mob/zombiepig/zpig4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xaf

    const-string v2, "sounds/mob/zombiepig/zpigdeath.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xb0

    const-string v2, "sounds/mob/zombiepig/zpigangry3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xb1

    const-string v2, "sounds/mob/zombiepig/zpig3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xb2

    const-string v2, "sounds/mob/zombiepig/zpighurt1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xb3

    const-string v2, "sounds/mob/zombiepig/zpigangry1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xb4

    const-string v2, "sounds/mob/zombiepig/zpig1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xb5

    const-string v2, "sounds/mob/zombiepig/zpigangry2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xb6

    const-string v2, "sounds/mob/zombiepig/zpighurt2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xb7

    const-string v2, "sounds/mob/zombiepig/zpigangry4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xb8

    const-string v2, "sounds/mob/zombiepig/zpig2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xb9

    const-string v2, "sounds/mob/magmacube/jump1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xba

    const-string v2, "sounds/mob/magmacube/big3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xbb

    const-string v2, "sounds/mob/magmacube/big4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xbc

    const-string v2, "sounds/mob/magmacube/small1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xbd

    const-string v2, "sounds/mob/magmacube/small4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xbe

    const-string v2, "sounds/mob/magmacube/small3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xbf

    const-string v2, "sounds/mob/magmacube/big1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xc0

    const-string v2, "sounds/mob/magmacube/small5.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xc1

    const-string v2, "sounds/mob/magmacube/jump2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xc2

    const-string v2, "sounds/mob/magmacube/big2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xc3

    const-string v2, "sounds/mob/magmacube/small2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xc4

    const-string v2, "sounds/mob/magmacube/jump3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xc5

    const-string v2, "sounds/mob/magmacube/jump4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xc6

    const-string v2, "sounds/mob/spider/step2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xc7

    const-string v2, "sounds/mob/spider/say1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xc8

    const-string v2, "sounds/mob/spider/step4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xc9

    const-string v2, "sounds/mob/spider/step3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xca

    const-string v2, "sounds/mob/spider/say2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xcb

    const-string v2, "sounds/mob/spider/say3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xcc

    const-string v2, "sounds/mob/spider/step1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xcd

    const-string v2, "sounds/mob/spider/say4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xce

    const-string v2, "sounds/mob/spider/death.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xcf

    const-string v2, "sounds/mob/blaze/hit2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xd0

    const-string v2, "sounds/mob/blaze/breathe4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xd1

    const-string v2, "sounds/mob/blaze/hit4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xd2

    const-string v2, "sounds/mob/blaze/hit3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xd3

    const-string v2, "sounds/mob/blaze/breathe2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xd4

    const-string v2, "sounds/mob/blaze/hit1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xd5

    const-string v2, "sounds/mob/blaze/breathe1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xd6

    const-string v2, "sounds/mob/blaze/death.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xd7

    const-string v2, "sounds/mob/blaze/breathe3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xd8

    const-string v2, "sounds/mob/ghast/moan6.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xd9

    const-string v2, "sounds/mob/ghast/moan2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xda

    const-string v2, "sounds/mob/ghast/moan1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xdb

    const-string v2, "sounds/mob/ghast/scream5.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xdc

    const-string v2, "sounds/mob/ghast/fireball4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xdd

    const-string v2, "sounds/mob/ghast/moan5.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xde

    const-string v2, "sounds/mob/ghast/scream2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xdf

    const-string v2, "sounds/mob/ghast/scream1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xe0

    const-string v2, "sounds/mob/ghast/scream3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xe1

    const-string v2, "sounds/mob/ghast/moan3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xe2

    const-string v2, "sounds/mob/ghast/moan7.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xe3

    const-string v2, "sounds/mob/ghast/charge.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xe4

    const-string v2, "sounds/mob/ghast/scream4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xe5

    const-string v2, "sounds/mob/ghast/moan4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xe6

    const-string v2, "sounds/mob/ghast/affectionate_scream.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xe7

    const-string v2, "sounds/mob/ghast/death.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xe8

    const-string v2, "sounds/mob/rabbit/hop4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xe9

    const-string v2, "sounds/mob/rabbit/idle1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xea

    const-string v2, "sounds/mob/rabbit/hurt4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xeb

    const-string v2, "sounds/mob/rabbit/idle2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xec

    const-string v2, "sounds/mob/rabbit/idle4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xed

    const-string v2, "sounds/mob/rabbit/hurt1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xee

    const-string v2, "sounds/mob/rabbit/hop1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xef

    const-string v2, "sounds/mob/rabbit/hurt2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xf0

    const-string v2, "sounds/mob/rabbit/bunnymurder.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xf1

    const-string v2, "sounds/mob/rabbit/hop3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xf2

    const-string v2, "sounds/mob/rabbit/idle3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xf3

    const-string v2, "sounds/mob/rabbit/hurt3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xf4

    const-string v2, "sounds/mob/rabbit/hop2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xf5

    const-string v2, "sounds/mob/pig/step2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xf6

    const-string v2, "sounds/mob/pig/step5.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xf7

    const-string v2, "sounds/mob/pig/say1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xf8

    const-string v2, "sounds/mob/pig/step4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xf9

    const-string v2, "sounds/mob/pig/step3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xfa

    const-string v2, "sounds/mob/pig/say2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xfb

    const-string v2, "sounds/mob/pig/say3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xfc

    const-string v2, "sounds/mob/pig/step1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xfd

    const-string v2, "sounds/mob/pig/death.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xfe

    const-string v2, "sounds/mob/witch/ambient2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0xff

    const-string v2, "sounds/mob/witch/drink4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x100

    const-string v2, "sounds/mob/witch/drink1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x101

    const-string v2, "sounds/mob/witch/throw3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x102

    const-string v2, "sounds/mob/witch/death1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x103

    const-string v2, "sounds/mob/witch/drink2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x104

    const-string v2, "sounds/mob/witch/ambient5.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x105

    const-string v2, "sounds/mob/witch/death2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x106

    const-string v2, "sounds/mob/witch/hurt1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x107

    const-string v2, "sounds/mob/witch/throw2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x108

    const-string v2, "sounds/mob/witch/throw1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x109

    const-string v2, "sounds/mob/witch/ambient4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x10a

    const-string v2, "sounds/mob/witch/death3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x10b

    const-string v2, "sounds/mob/witch/hurt2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x10c

    const-string v2, "sounds/mob/witch/ambient3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x10d

    const-string v2, "sounds/mob/witch/ambient1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x10e

    const-string v2, "sounds/mob/witch/drink3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x10f

    const-string v2, "sounds/mob/witch/hurt3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x110

    const-string v2, "sounds/mob/endermen/hit2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x111

    const-string v2, "sounds/mob/endermen/hit4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x112

    const-string v2, "sounds/mob/endermen/idle1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x113

    const-string v2, "sounds/mob/endermen/idle2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x114

    const-string v2, "sounds/mob/endermen/hit3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x115

    const-string v2, "sounds/mob/endermen/idle4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x116

    const-string v2, "sounds/mob/endermen/hit1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x117

    const-string v2, "sounds/mob/endermen/scream2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x118

    const-string v2, "sounds/mob/endermen/stare.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x119

    const-string v2, "sounds/mob/endermen/scream1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x11a

    const-string v2, "sounds/mob/endermen/scream3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x11b

    const-string v2, "sounds/mob/endermen/scream4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x11c

    const-string v2, "sounds/mob/endermen/portal.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x11d

    const-string v2, "sounds/mob/endermen/idle5.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x11e

    const-string v2, "sounds/mob/endermen/idle3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x11f

    const-string v2, "sounds/mob/endermen/portal2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x120

    const-string v2, "sounds/mob/endermen/death.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x121

    const-string v2, "sounds/mob/slime/big3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x122

    const-string v2, "sounds/mob/slime/big4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x123

    const-string v2, "sounds/mob/slime/small1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x124

    const-string v2, "sounds/mob/slime/small4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x125

    const-string v2, "sounds/mob/slime/small3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x126

    const-string v2, "sounds/mob/slime/big1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x127

    const-string v2, "sounds/mob/slime/small5.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x128

    const-string v2, "sounds/mob/slime/big2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x129

    const-string v2, "sounds/mob/slime/small2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x12a

    const-string v2, "sounds/mob/creeper/say1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x12b

    const-string v2, "sounds/mob/creeper/say2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x12c

    const-string v2, "sounds/mob/creeper/say3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x12d

    const-string v2, "sounds/mob/creeper/say4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x12e

    const-string v2, "sounds/mob/creeper/death.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x12f

    const-string v2, "sounds/mob/sheep/step2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x130

    const-string v2, "sounds/mob/sheep/step5.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x131

    const-string v2, "sounds/mob/sheep/say1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x132

    const-string v2, "sounds/mob/sheep/step4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x133

    const-string v2, "sounds/mob/sheep/step3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x134

    const-string v2, "sounds/mob/sheep/say2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x135

    const-string v2, "sounds/mob/sheep/say3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x136

    const-string v2, "sounds/mob/sheep/shear.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x137

    const-string v2, "sounds/mob/sheep/step1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x138

    const-string v2, "sounds/mob/zombie/woodbreak.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x139

    const-string v2, "sounds/mob/zombie/remedy.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x13a

    const-string v2, "sounds/mob/zombie/step2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x13b

    const-string v2, "sounds/mob/zombie/step5.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x13c

    const-string v2, "sounds/mob/zombie/wood2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x13d

    const-string v2, "sounds/mob/zombie/say1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x13e

    const-string v2, "sounds/mob/zombie/hurt1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x13f

    const-string v2, "sounds/mob/zombie/step4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x140

    const-string v2, "sounds/mob/zombie/step3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x141

    const-string v2, "sounds/mob/zombie/say2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x142

    const-string v2, "sounds/mob/zombie/say3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x143

    const-string v2, "sounds/mob/zombie/step1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x144

    const-string v2, "sounds/mob/zombie/hurt2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x145

    const-string v2, "sounds/mob/zombie/wood3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x146

    const-string v2, "sounds/mob/zombie/wood4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x147

    const-string v2, "sounds/mob/zombie/wood1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x148

    const-string v2, "sounds/mob/zombie/death.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x149

    const-string v2, "sounds/portal/trigger.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x14a

    const-string v2, "sounds/portal/portal.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x14b

    const-string v2, "sounds/liquid/water.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x14c

    const-string v2, "sounds/liquid/lava.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x14d

    const-string v2, "sounds/liquid/lavapop.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x14e

    const-string v2, "sounds/sounds.json"

    aput-object v2, v0, v1

    const/16 v1, 0x14f

    const-string v2, "sounds/block/itemframe/break2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x150

    const-string v2, "sounds/block/itemframe/add_item4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x151

    const-string v2, "sounds/block/itemframe/place1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x152

    const-string v2, "sounds/block/itemframe/add_item1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x153

    const-string v2, "sounds/block/itemframe/remove_item4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x154

    const-string v2, "sounds/block/itemframe/place3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x155

    const-string v2, "sounds/block/itemframe/remove_item1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x156

    const-string v2, "sounds/block/itemframe/rotate_item4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x157

    const-string v2, "sounds/block/itemframe/add_item3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x158

    const-string v2, "sounds/block/itemframe/remove_item3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x159

    const-string v2, "sounds/block/itemframe/break3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x15a

    const-string v2, "sounds/block/itemframe/rotate_item2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x15b

    const-string v2, "sounds/block/itemframe/remove_item2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x15c

    const-string v2, "sounds/block/itemframe/place2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x15d

    const-string v2, "sounds/block/itemframe/add_item2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x15e

    const-string v2, "sounds/block/itemframe/place4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x15f

    const-string v2, "sounds/block/itemframe/break1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x160

    const-string v2, "sounds/block/itemframe/rotate_item3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x161

    const-string v2, "sounds/block/itemframe/rotate_item1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x162

    const-string v2, "sounds/step/snow4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x163

    const-string v2, "sounds/step/ladder4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x164

    const-string v2, "sounds/step/gravel4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x165

    const-string v2, "sounds/step/stone3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x166

    const-string v2, "sounds/step/grass6.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x167

    const-string v2, "sounds/step/stone1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x168

    const-string v2, "sounds/step/stone5.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x169

    const-string v2, "sounds/step/ladder5.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x16a

    const-string v2, "sounds/step/snow3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x16b

    const-string v2, "sounds/step/sand4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x16c

    const-string v2, "sounds/step/gravel3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x16d

    const-string v2, "sounds/step/wood2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x16e

    const-string v2, "sounds/step/grass4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x16f

    const-string v2, "sounds/step/ladder3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x170

    const-string v2, "sounds/step/grass1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x171

    const-string v2, "sounds/step/wood6.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x172

    const-string v2, "sounds/step/sand3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x173

    const-string v2, "sounds/step/ladder2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x174

    const-string v2, "sounds/step/grass2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x175

    const-string v2, "sounds/step/sand5.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x176

    const-string v2, "sounds/step/gravel1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x177

    const-string v2, "sounds/step/cloth2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x178

    const-string v2, "sounds/step/snow2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x179

    const-string v2, "sounds/step/cloth4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x17a

    const-string v2, "sounds/step/snow1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x17b

    const-string v2, "sounds/step/cloth1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x17c

    const-string v2, "sounds/step/wood5.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x17d

    const-string v2, "sounds/step/grass5.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x17e

    const-string v2, "sounds/step/sand1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x17f

    const-string v2, "sounds/step/gravel2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x180

    const-string v2, "sounds/step/stone4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x181

    const-string v2, "sounds/step/wood3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x182

    const-string v2, "sounds/step/stone2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x183

    const-string v2, "sounds/step/wood4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x184

    const-string v2, "sounds/step/ladder1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x185

    const-string v2, "sounds/step/grass3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x186

    const-string v2, "sounds/step/stone6.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x187

    const-string v2, "sounds/step/wood1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x188

    const-string v2, "sounds/step/sand2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x189

    const-string v2, "sounds/step/cloth3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x18a

    const-string v2, "sounds/damage/hit2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x18b

    const-string v2, "sounds/damage/fallbig.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x18c

    const-string v2, "sounds/damage/hit3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x18d

    const-string v2, "sounds/damage/hit1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x18e

    const-string v2, "sounds/damage/fallsmall.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x18f

    const-string v2, "sounds/note/pling.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x190

    const-string v2, "sounds/note/bassattack.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x191

    const-string v2, "sounds/note/bd.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x192

    const-string v2, "sounds/note/bass.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x193

    const-string v2, "sounds/note/snare.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x194

    const-string v2, "sounds/note/harp.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x195

    const-string v2, "sounds/note/hat.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x196

    const-string v2, "sounds/fire/fire.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x197

    const-string v2, "sounds/fire/ignite.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x198

    const-string v2, "sounds/ambient/weather/rain2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x199

    const-string v2, "sounds/ambient/weather/rain1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x19a

    const-string v2, "sounds/ambient/weather/thunder3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x19b

    const-string v2, "sounds/ambient/weather/rain3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x19c

    const-string v2, "sounds/ambient/weather/thunder1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x19d

    const-string v2, "sounds/ambient/weather/thunder2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x19e

    const-string v2, "sounds/ambient/weather/rain4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x19f

    const-string v2, "sounds/random/anvil_land.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1a0

    const-string v2, "sounds/random/bow.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1a1

    const-string v2, "sounds/random/eat3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1a2

    const-string v2, "sounds/random/explode4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1a3

    const-string v2, "sounds/random/anvil_break.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1a4

    const-string v2, "sounds/random/explode1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1a5

    const-string v2, "sounds/random/glass2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1a6

    const-string v2, "sounds/random/bowhit4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1a7

    const-string v2, "sounds/random/pop.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1a8

    const-string v2, "sounds/random/swim1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1a9

    const-string v2, "sounds/random/hurt.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1aa

    const-string v2, "sounds/random/anvil_use.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1ab

    const-string v2, "sounds/random/explode3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1ac

    const-string v2, "sounds/random/bowhit3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1ad

    const-string v2, "sounds/random/orb.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1ae

    const-string v2, "sounds/random/fizz.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1af

    const-string v2, "sounds/random/door_close.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1b0

    const-string v2, "sounds/random/burp.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1b1

    const-string v2, "sounds/random/bowhit1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1b2

    const-string v2, "sounds/random/bowhit2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1b3

    const-string v2, "sounds/random/chestopen.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1b4

    const-string v2, "sounds/random/glass1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1b5

    const-string v2, "sounds/random/splash.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1b6

    const-string v2, "sounds/random/pop2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1b7

    const-string v2, "sounds/random/eat1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1b8

    const-string v2, "sounds/random/swim3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1b9

    const-string v2, "sounds/random/levelup.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1ba

    const-string v2, "sounds/random/chestclosed.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1bb

    const-string v2, "sounds/random/swim2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1bc

    const-string v2, "sounds/random/explode2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1bd

    const-string v2, "sounds/random/swim4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1be

    const-string v2, "sounds/random/drink.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1bf

    const-string v2, "sounds/random/click.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1c0

    const-string v2, "sounds/random/fuse.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1c1

    const-string v2, "sounds/random/break.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1c2

    const-string v2, "sounds/random/eat2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1c3

    const-string v2, "sounds/random/glass3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1c4

    const-string v2, "sounds/random/door_open.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1c5

    const-string v2, "sounds/dig/snow4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1c6

    const-string v2, "sounds/dig/gravel4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1c7

    const-string v2, "sounds/dig/stone3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1c8

    const-string v2, "sounds/dig/stone1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1c9

    const-string v2, "sounds/dig/snow3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1ca

    const-string v2, "sounds/dig/sand4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1cb

    const-string v2, "sounds/dig/gravel3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1cc

    const-string v2, "sounds/dig/wood2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1cd

    const-string v2, "sounds/dig/grass4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1ce

    const-string v2, "sounds/dig/grass1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1cf

    const-string v2, "sounds/dig/sand3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1d0

    const-string v2, "sounds/dig/grass2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1d1

    const-string v2, "sounds/dig/gravel1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1d2

    const-string v2, "sounds/dig/cloth2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1d3

    const-string v2, "sounds/dig/snow2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1d4

    const-string v2, "sounds/dig/cloth4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1d5

    const-string v2, "sounds/dig/snow1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1d6

    const-string v2, "sounds/dig/cloth1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1d7

    const-string v2, "sounds/dig/sand1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1d8

    const-string v2, "sounds/dig/gravel2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1d9

    const-string v2, "sounds/dig/stone4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1da

    const-string v2, "sounds/dig/wood3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1db

    const-string v2, "sounds/dig/stone2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1dc

    const-string v2, "sounds/dig/wood4.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1dd

    const-string v2, "sounds/dig/grass3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1de

    const-string v2, "sounds/dig/wood1.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1df

    const-string v2, "sounds/dig/sand2.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1e0

    const-string v2, "sounds/dig/cloth3.fsb"

    aput-object v2, v0, v1

    const/16 v1, 0x1e1

    const-string v2, "images/mob/villager/farmer.png"

    aput-object v2, v0, v1

    const/16 v1, 0x1e2

    const-string v2, "images/mob/villager/smith.png"

    aput-object v2, v0, v1

    const/16 v1, 0x1e3

    const-string v2, "images/mob/villager/priest.png"

    aput-object v2, v0, v1

    const/16 v1, 0x1e4

    const-string v2, "images/mob/villager/butcher.png"

    aput-object v2, v0, v1

    const/16 v1, 0x1e5

    const-string v2, "images/mob/villager/villager.png"

    aput-object v2, v0, v1

    const/16 v1, 0x1e6

    const-string v2, "images/mob/villager/librarian.png"

    aput-object v2, v0, v1

    const/16 v1, 0x1e7

    const-string v2, "images/mob/wolf_tame.tga"

    aput-object v2, v0, v1

    const/16 v1, 0x1e8

    const-string v2, "images/mob/silverfish.png"

    aput-object v2, v0, v1

    const/16 v1, 0x1e9

    const-string v2, "images/mob/squid.png"

    aput-object v2, v0, v1

    const/16 v1, 0x1ea

    const-string v2, "images/mob/cave_spider.tga"

    aput-object v2, v0, v1

    const/16 v1, 0x1eb

    const-string v2, "images/mob/alex.png"

    aput-object v2, v0, v1

    const/16 v1, 0x1ec

    const-string v2, "images/mob/blaze.tga"

    aput-object v2, v0, v1

    const/16 v1, 0x1ed

    const-string v2, "images/mob/witch.png"

    aput-object v2, v0, v1

    const/16 v1, 0x1ee

    const-string v2, "images/mob/steve.png"

    aput-object v2, v0, v1

    const/16 v1, 0x1ef

    const-string v2, "images/mob/ghast_shooting.tga"

    aput-object v2, v0, v1

    const/16 v1, 0x1f0

    const-string v2, "images/mob/mooshroom.png"

    aput-object v2, v0, v1

    const/16 v1, 0x1f1

    const-string v2, "images/mob/pig.png"

    aput-object v2, v0, v1

    const/16 v1, 0x1f2

    const-string v2, "images/mob/creeper_armor.png"

    aput-object v2, v0, v1

    const/16 v1, 0x1f3

    const-string v2, "images/mob/sheep.tga"

    aput-object v2, v0, v1

    const/16 v1, 0x1f4

    const-string v2, "images/mob/skeleton.png"

    aput-object v2, v0, v1

    const/16 v1, 0x1f5

    const-string v2, "images/mob/wither_skeleton.png"

    aput-object v2, v0, v1

    const/16 v1, 0x1f6

    const-string v2, "images/mob/cat/siamese.png"

    aput-object v2, v0, v1

    const/16 v1, 0x1f7

    const-string v2, "images/mob/cat/ocelot.png"

    aput-object v2, v0, v1

    const/16 v1, 0x1f8

    const-string v2, "images/mob/cat/red.png"

    aput-object v2, v0, v1

    const/16 v1, 0x1f9

    const-string v2, "images/mob/cat/blackcat.png"

    aput-object v2, v0, v1

    const/16 v1, 0x1fa

    const-string v2, "images/mob/iron_golem.png"

    aput-object v2, v0, v1

    const/16 v1, 0x1fb

    const-string v2, "images/mob/enderman.tga"

    aput-object v2, v0, v1

    const/16 v1, 0x1fc

    const-string v2, "images/mob/zombie_villager/zombie_priest.png"

    aput-object v2, v0, v1

    const/16 v1, 0x1fd

    const-string v2, "images/mob/zombie_villager/zombie_smith.png"

    aput-object v2, v0, v1

    const/16 v1, 0x1fe

    const-string v2, "images/mob/zombie_villager/zombie_villager.png"

    aput-object v2, v0, v1

    const/16 v1, 0x1ff

    const-string v2, "images/mob/zombie_villager/zombie_butcher.png"

    aput-object v2, v0, v1

    const/16 v1, 0x200

    const-string v2, "images/mob/zombie_villager/zombie_farmer.png"

    aput-object v2, v0, v1

    const/16 v1, 0x201

    const-string v2, "images/mob/zombie_villager/zombie_librarian.png"

    aput-object v2, v0, v1

    const/16 v1, 0x202

    const-string v2, "images/mob/pigzombie.png"

    aput-object v2, v0, v1

    const/16 v1, 0x203

    const-string v2, "images/mob/spider.tga"

    aput-object v2, v0, v1

    const/16 v1, 0x204

    const-string v2, "images/mob/saddle.png"

    aput-object v2, v0, v1

    const/16 v1, 0x205

    const-string v2, "images/mob/bat.png"

    aput-object v2, v0, v1

    const/16 v1, 0x206

    const-string v2, "images/mob/rabbit/blackrabbit.png"

    aput-object v2, v0, v1

    const/16 v1, 0x207

    const-string v2, "images/mob/rabbit/toast.png"

    aput-object v2, v0, v1

    const/16 v1, 0x208

    const-string v2, "images/mob/rabbit/brown.png"

    aput-object v2, v0, v1

    const/16 v1, 0x209

    const-string v2, "images/mob/rabbit/white_splotched.png"

    aput-object v2, v0, v1

    const/16 v1, 0x20a

    const-string v2, "images/mob/rabbit/salt.png"

    aput-object v2, v0, v1

    const/16 v1, 0x20b

    const-string v2, "images/mob/rabbit/white.png"

    aput-object v2, v0, v1

    const/16 v1, 0x20c

    const-string v2, "images/mob/rabbit/gold.png"

    aput-object v2, v0, v1

    const/16 v1, 0x20d

    const-string v2, "images/mob/skins/Festive/sweater_steve.png"

    aput-object v2, v0, v1

    const/16 v1, 0x20e

    const-string v2, "images/mob/skins/Festive/rudolph.png"

    aput-object v2, v0, v1

    const/16 v1, 0x20f

    const-string v2, "images/mob/skins/Festive/Festive.json"

    aput-object v2, v0, v1

    const/16 v1, 0x210

    const-string v2, "images/mob/skins/Festive/Festive_Snow_Suit_Kid.png"

    aput-object v2, v0, v1

    const/16 v1, 0x211

    const-string v2, "images/mob/skins/Festive/gingerbread_creeperSlim.png"

    aput-object v2, v0, v1

    const/16 v1, 0x212

    const-string v2, "images/mob/skins/Festive/gingerbread.png"

    aput-object v2, v0, v1

    const/16 v1, 0x213

    const-string v2, "images/mob/skins/Festive/mrs_claus_slim.png"

    aput-object v2, v0, v1

    const/16 v1, 0x214

    const-string v2, "images/mob/skins/Festive/mother_christmas.png"

    aput-object v2, v0, v1

    const/16 v1, 0x215

    const-string v2, "images/mob/skins/Festive/tomte.png"

    aput-object v2, v0, v1

    const/16 v1, 0x216

    const-string v2, "images/mob/skins/Festive/santa.png"

    aput-object v2, v0, v1

    const/16 v1, 0x217

    const-string v2, "images/mob/skins/Festive/parka_steve.png"

    aput-object v2, v0, v1

    const/16 v1, 0x218

    const-string v2, "images/mob/skins/Festive/greenelf.png"

    aput-object v2, v0, v1

    const/16 v1, 0x219

    const-string v2, "images/mob/skins/Festive/Festive_Ski_Bibs_Slim.png"

    aput-object v2, v0, v1

    const/16 v1, 0x21a

    const-string v2, "images/mob/skins/Festive/Festive_Pajama_Kid_Slim.png"

    aput-object v2, v0, v1

    const/16 v1, 0x21b

    const-string v2, "images/mob/skins/Festive/Festive_Sweater_Alex_Slim.png"

    aput-object v2, v0, v1

    const/16 v1, 0x21c

    const-string v2, "images/mob/skins/Festive/father_christmas.png"

    aput-object v2, v0, v1

    const/16 v1, 0x21d

    const-string v2, "images/mob/skins/TownFolk/Castaway.png"

    aput-object v2, v0, v1

    const/16 v1, 0x21e

    const-string v2, "images/mob/skins/TownFolk/Shopkeeper_slim.png"

    aput-object v2, v0, v1

    const/16 v1, 0x21f

    const-string v2, "images/mob/skins/TownFolk/Bandit_slim.png"

    aput-object v2, v0, v1

    const/16 v1, 0x220

    const-string v2, "images/mob/skins/TownFolk/FarmerSkin.png"

    aput-object v2, v0, v1

    const/16 v1, 0x221

    const-string v2, "images/mob/skins/TownFolk/Witch_slim.png"

    aput-object v2, v0, v1

    const/16 v1, 0x222

    const-string v2, "images/mob/skins/TownFolk/Monk.png"

    aput-object v2, v0, v1

    const/16 v1, 0x223

    const-string v2, "images/mob/skins/TownFolk/Thief.png"

    aput-object v2, v0, v1

    const/16 v1, 0x224

    const-string v2, "images/mob/skins/TownFolk/StrongMan.png"

    aput-object v2, v0, v1

    const/16 v1, 0x225

    const-string v2, "images/mob/skins/TownFolk/OldMan.png"

    aput-object v2, v0, v1

    const/16 v1, 0x226

    const-string v2, "images/mob/skins/TownFolk/Bard.png"

    aput-object v2, v0, v1

    const/16 v1, 0x227

    const-string v2, "images/mob/skins/TownFolk/TownCrier.png"

    aput-object v2, v0, v1

    const/16 v1, 0x228

    const-string v2, "images/mob/skins/TownFolk/Mime.png"

    aput-object v2, v0, v1

    const/16 v1, 0x229

    const-string v2, "images/mob/skins/TownFolk/OldLady.png"

    aput-object v2, v0, v1

    const/16 v1, 0x22a

    const-string v2, "images/mob/skins/TownFolk/Peasant.png"

    aput-object v2, v0, v1

    const/16 v1, 0x22b

    const-string v2, "images/mob/skins/TownFolk/Townswoman.png"

    aput-object v2, v0, v1

    const/16 v1, 0x22c

    const-string v2, "images/mob/skins/TownFolk/Forester.png"

    aput-object v2, v0, v1

    const/16 v1, 0x22d

    const-string v2, "images/mob/skins/TownFolk/Rogue.png"

    aput-object v2, v0, v1

    const/16 v1, 0x22e

    const-string v2, "images/mob/skins/TownFolk/Gardener.png"

    aput-object v2, v0, v1

    const/16 v1, 0x22f

    const-string v2, "images/mob/skins/TownFolk/Miner.png"

    aput-object v2, v0, v1

    const/16 v1, 0x230

    const-string v2, "images/mob/skins/TownFolk/Vagrant.png"

    aput-object v2, v0, v1

    const/16 v1, 0x231

    const-string v2, "images/mob/skins/CityFolk/Baker.png"

    aput-object v2, v0, v1

    const/16 v1, 0x232

    const-string v2, "images/mob/skins/CityFolk/Victorian.png"

    aput-object v2, v0, v1

    const/16 v1, 0x233

    const-string v2, "images/mob/skins/CityFolk/King.png"

    aput-object v2, v0, v1

    const/16 v1, 0x234

    const-string v2, "images/mob/skins/CityFolk/Barman.png"

    aput-object v2, v0, v1

    const/16 v1, 0x235

    const-string v2, "images/mob/skins/CityFolk/HolyWoman.png"

    aput-object v2, v0, v1

    const/16 v1, 0x236

    const-string v2, "images/mob/skins/CityFolk/Baron.png"

    aput-object v2, v0, v1

    const/16 v1, 0x237

    const-string v2, "images/mob/skins/CityFolk/Blacksmith.png"

    aput-object v2, v0, v1

    const/16 v1, 0x238

    const-string v2, "images/mob/skins/CityFolk/Chef.png"

    aput-object v2, v0, v1

    const/16 v1, 0x239

    const-string v2, "images/mob/skins/CityFolk/WeaponSmith.png"

    aput-object v2, v0, v1

    const/16 v1, 0x23a

    const-string v2, "images/mob/skins/CityFolk/Jailer.png"

    aput-object v2, v0, v1

    const/16 v1, 0x23b

    const-string v2, "images/mob/skins/CityFolk/Carpenter.png"

    aput-object v2, v0, v1

    const/16 v1, 0x23c

    const-string v2, "images/mob/skins/CityFolk/Mage.png"

    aput-object v2, v0, v1

    const/16 v1, 0x23d

    const-string v2, "images/mob/skins/CityFolk/HolyMan.png"

    aput-object v2, v0, v1

    const/16 v1, 0x23e

    const-string v2, "images/mob/skins/CityFolk/Baroness.png"

    aput-object v2, v0, v1

    const/16 v1, 0x23f

    const-string v2, "images/mob/skins/CityFolk/Shoemaker.png"

    aput-object v2, v0, v1

    const/16 v1, 0x240

    const-string v2, "images/mob/skins/CityFolk/ButcherSkin.png"

    aput-object v2, v0, v1

    const/16 v1, 0x241

    const-string v2, "images/mob/skins/CityFolk/Watchman.png"

    aput-object v2, v0, v1

    const/16 v1, 0x242

    const-string v2, "images/mob/skins/CityFolk/Queen.png"

    aput-object v2, v0, v1

    const/16 v1, 0x243

    const-string v2, "images/mob/skins/CityFolk/Postman.png"

    aput-object v2, v0, v1

    const/16 v1, 0x244

    const-string v2, "images/mob/skins/CityFolk/Barmaid_slim.png"

    aput-object v2, v0, v1

    const/16 v1, 0x245

    const-string v2, "images/mob/skins/JTTW/blackwinddemon.png"

    aput-object v2, v0, v1

    const/16 v1, 0x246

    const-string v2, "images/mob/skins/JTTW/xuangzang_slim.png"

    aput-object v2, v0, v1

    const/16 v1, 0x247

    const-string v2, "images/mob/skins/JTTW/bull_demon_king.png"

    aput-object v2, v0, v1

    const/16 v1, 0x248

    const-string v2, "images/mob/skins/JTTW/Scorpion_Demon_Slim.png"

    aput-object v2, v0, v1

    const/16 v1, 0x249

    const-string v2, "images/mob/skins/JTTW/princess_iron_fan_slim.png"

    aput-object v2, v0, v1

    const/16 v1, 0x24a

    const-string v2, "images/mob/skins/JTTW/sha_wujing.png"

    aput-object v2, v0, v1

    const/16 v1, 0x24b

    const-string v2, "images/mob/skins/JTTW/spider_demon_slim.png"

    aput-object v2, v0, v1

    const/16 v1, 0x24c

    const-string v2, "images/mob/skins/JTTW/zhu_bajie.png"

    aput-object v2, v0, v1

    const/16 v1, 0x24d

    const-string v2, "images/mob/skins/JTTW/guanyin_slim.png"

    aput-object v2, v0, v1

    const/16 v1, 0x24e

    const-string v2, "images/mob/skins/JTTW/Many_Eyed_Demon_Lord.png"

    aput-object v2, v0, v1

    const/16 v1, 0x24f

    const-string v2, "images/mob/skins/JTTW/Jade_Emperor.png"

    aput-object v2, v0, v1

    const/16 v1, 0x250

    const-string v2, "images/mob/skins/JTTW/JTTW.json"

    aput-object v2, v0, v1

    const/16 v1, 0x251

    const-string v2, "images/mob/skins/JTTW/Baigujing_Slim.png"

    aput-object v2, v0, v1

    const/16 v1, 0x252

    const-string v2, "images/mob/skins/JTTW/lady_earth_flow_slim.png"

    aput-object v2, v0, v1

    const/16 v1, 0x253

    const-string v2, "images/mob/skins/JTTW/Red_Boy.png"

    aput-object v2, v0, v1

    const/16 v1, 0x254

    const-string v2, "images/mob/skins/JTTW/monkeyking.png"

    aput-object v2, v0, v1

    const/16 v1, 0x255

    const-string v2, "images/mob/skins/Base/alex.png"

    aput-object v2, v0, v1

    const/16 v1, 0x256

    const-string v2, "images/mob/skins/Base/steve.png"

    aput-object v2, v0, v1

    const/16 v1, 0x257

    const-string v2, "images/mob/skins/Base/Mobs.json"

    aput-object v2, v0, v1

    const/16 v1, 0x258

    const-string v2, "images/mob/skins/Base/Vanilla.json"

    aput-object v2, v0, v1

    const/16 v1, 0x259

    const-string v2, "images/mob/skins/Halloween/snow_golem_costume.png"

    aput-object v2, v0, v1

    const/16 v1, 0x25a

    const-string v2, "images/mob/skins/Halloween/rainbow_sheep_costume.png"

    aput-object v2, v0, v1

    const/16 v1, 0x25b

    const-string v2, "images/mob/skins/Halloween/cow_costume.png"

    aput-object v2, v0, v1

    const/16 v1, 0x25c

    const-string v2, "images/mob/skins/Halloween/spider_costume.png"

    aput-object v2, v0, v1

    const/16 v1, 0x25d

    const-string v2, "images/mob/skins/Halloween/pig_costume.png"

    aput-object v2, v0, v1

    const/16 v1, 0x25e

    const-string v2, "images/mob/skins/Halloween/ghast_costume.png"

    aput-object v2, v0, v1

    const/16 v1, 0x25f

    const-string v2, "images/mob/skins/Halloween/enderman_costume.png"

    aput-object v2, v0, v1

    const/16 v1, 0x260

    const-string v2, "images/mob/skins/Halloween/ocelot_costume.png"

    aput-object v2, v0, v1

    const/16 v1, 0x261

    const-string v2, "images/mob/skins/Halloween/zombie_pigman_costume.png"

    aput-object v2, v0, v1

    const/16 v1, 0x262

    const-string v2, "images/mob/skins/Halloween/zombie_costume.png"

    aput-object v2, v0, v1

    const/16 v1, 0x263

    const-string v2, "images/mob/skins/Halloween/iron_golem_costume.png"

    aput-object v2, v0, v1

    const/16 v1, 0x264

    const-string v2, "images/mob/skins/Halloween/creeper_costume.png"

    aput-object v2, v0, v1

    const/16 v1, 0x265

    const-string v2, "images/mob/skins/Halloween/mooshroom_costume.png"

    aput-object v2, v0, v1

    const/16 v1, 0x266

    const-string v2, "images/mob/skins/Halloween/skeleton_costume.png"

    aput-object v2, v0, v1

    const/16 v1, 0x267

    const-string v2, "images/mob/skins/Halloween/pink_sheep_costume.png"

    aput-object v2, v0, v1

    const/16 v1, 0x268

    const-string v2, "images/mob/skins/Redstone/Redstone_Trapper.png"

    aput-object v2, v0, v1

    const/16 v1, 0x269

    const-string v2, "images/mob/skins/Redstone/Redstone_Electrician.png"

    aput-object v2, v0, v1

    const/16 v1, 0x26a

    const-string v2, "images/mob/skins/Redstone/Redstone_Hoarder.png"

    aput-object v2, v0, v1

    const/16 v1, 0x26b

    const-string v2, "images/mob/skins/Redstone/Redstone_Artisan_Slim.png"

    aput-object v2, v0, v1

    const/16 v1, 0x26c

    const-string v2, "images/mob/skins/Redstone/Redstone_Composer.png"

    aput-object v2, v0, v1

    const/16 v1, 0x26d

    const-string v2, "images/mob/skins/Redstone/redstone.json"

    aput-object v2, v0, v1

    const/16 v1, 0x26e

    const-string v2, "images/mob/skins/Redstone/Redstone_Programmer_Slim.png"

    aput-object v2, v0, v1

    const/16 v1, 0x26f

    const-string v2, "images/mob/skins/Redstone/Redstone_Tinkerer.png"

    aput-object v2, v0, v1

    const/16 v1, 0x270

    const-string v2, "images/mob/skins/Redstone/Redstone_Golem.png"

    aput-object v2, v0, v1

    const/16 v1, 0x271

    const-string v2, "images/mob/skins/Redstone/Redstone_Prospector_Slim.png"

    aput-object v2, v0, v1

    const/16 v1, 0x272

    const-string v2, "images/mob/skins/Redstone/Redstone_TNT_Technician.png"

    aput-object v2, v0, v1

    const/16 v1, 0x273

    const-string v2, "images/mob/skins/Redstone/Redstone_Architect_Slim.png"

    aput-object v2, v0, v1

    const/16 v1, 0x274

    const-string v2, "images/mob/skins/Redstone/Redstone_Rail_Rider_Slim.png"

    aput-object v2, v0, v1

    const/16 v1, 0x275

    const-string v2, "images/mob/skins/Redstone/Redstone_Experimenter_Slim.png"

    aput-object v2, v0, v1

    const/16 v1, 0x276

    const-string v2, "images/mob/skins/Redstone/Redstone_Miner_Slim.png"

    aput-object v2, v0, v1

    const/16 v1, 0x277

    const-string v2, "images/mob/skins/Redstone/Redstone_Chemist.png"

    aput-object v2, v0, v1

    const/16 v1, 0x278

    const-string v2, "images/mob/skins/PVP_Warriors/Desert_Husk_Slim.png"

    aput-object v2, v0, v1

    const/16 v1, 0x279

    const-string v2, "images/mob/skins/PVP_Warriors/Desert_Archer_Slim.png"

    aput-object v2, v0, v1

    const/16 v1, 0x27a

    const-string v2, "images/mob/skins/PVP_Warriors/Desert_Griefer.png"

    aput-object v2, v0, v1

    const/16 v1, 0x27b

    const-string v2, "images/mob/skins/PVP_Warriors/Desert_Hunter.png"

    aput-object v2, v0, v1

    const/16 v1, 0x27c

    const-string v2, "images/mob/skins/PVP_Warriors/Desert_Brawler_Slim.png"

    aput-object v2, v0, v1

    const/16 v1, 0x27d

    const-string v2, "images/mob/skins/PVP_Warriors/Forest_Woodbeast_Slim.png"

    aput-object v2, v0, v1

    const/16 v1, 0x27e

    const-string v2, "images/mob/skins/PVP_Warriors/Forest_Hunter_Slim.png"

    aput-object v2, v0, v1

    const/16 v1, 0x27f

    const-string v2, "images/mob/skins/PVP_Warriors/tundra_engineer.png"

    aput-object v2, v0, v1

    const/16 v1, 0x280

    const-string v2, "images/mob/skins/PVP_Warriors/tundra_brawler.png"

    aput-object v2, v0, v1

    const/16 v1, 0x281

    const-string v2, "images/mob/skins/PVP_Warriors/tundra_brewer_slim.png"

    aput-object v2, v0, v1

    const/16 v1, 0x282

    const-string v2, "images/mob/skins/PVP_Warriors/tundra_griefer_slim.png"

    aput-object v2, v0, v1

    const/16 v1, 0x283

    const-string v2, "images/mob/skins/PVP_Warriors/Desert_Brewer.png"

    aput-object v2, v0, v1

    const/16 v1, 0x284

    const-string v2, "images/mob/skins/PVP_Warriors/Forest_Tamer_Slim.png"

    aput-object v2, v0, v1

    const/16 v1, 0x285

    const-string v2, "images/mob/skins/PVP_Warriors/Forest_Griefer_Slim.png"

    aput-object v2, v0, v1

    const/16 v1, 0x286

    const-string v2, "images/mob/skins/PVP_Warriors/tundra_hunter_slim.png"

    aput-object v2, v0, v1

    const/16 v1, 0x287

    const-string v2, "images/mob/skins/PVP_Warriors/Forest_Brewer.png"

    aput-object v2, v0, v1

    const/16 v1, 0x288

    const-string v2, "images/mob/skins/PVP_Warriors/tundra_stray.png"

    aput-object v2, v0, v1

    const/16 v1, 0x289

    const-string v2, "images/mob/skins/PVP_Warriors/Forest_Brawler.png"

    aput-object v2, v0, v1

    const/16 v1, 0x28a

    const-string v2, "images/mob/skins/PVP_Warriors/Desert_Engineer.png"

    aput-object v2, v0, v1

    const/16 v1, 0x28b

    const-string v2, "images/mob/skins/PVP_Warriors/Forest_Archer.png"

    aput-object v2, v0, v1

    const/16 v1, 0x28c

    const-string v2, "images/mob/skins/PVP_Warriors/Forest_Engineer_Slim.png"

    aput-object v2, v0, v1

    const/16 v1, 0x28d

    const-string v2, "images/mob/skins/PVP_Warriors/tundra_tamer_slim.png"

    aput-object v2, v0, v1

    const/16 v1, 0x28e

    const-string v2, "images/mob/skins/PVP_Warriors/Desert_Tamer_Slim.png"

    aput-object v2, v0, v1

    const/16 v1, 0x28f

    const-string v2, "images/mob/skins/PVP_Warriors/tundra_archer.png"

    aput-object v2, v0, v1

    const/16 v1, 0x290

    const-string v2, "images/mob/magmacube.tga"

    aput-object v2, v0, v1

    const/16 v1, 0x291

    const-string v2, "images/mob/wolf_angry.png"

    aput-object v2, v0, v1

    const/16 v1, 0x292

    const-string v2, "images/mob/slime.png"

    aput-object v2, v0, v1

    const/16 v1, 0x293

    const-string v2, "images/mob/char.png"

    aput-object v2, v0, v1

    const/16 v1, 0x294

    const-string v2, "images/mob/creeper.png"

    aput-object v2, v0, v1

    const/16 v1, 0x295

    const-string v2, "images/mob/wolf.png"

    aput-object v2, v0, v1

    const/16 v1, 0x296

    const-string v2, "images/mob/zombie.png"

    aput-object v2, v0, v1

    const/16 v1, 0x297

    const-string v2, "images/mob/snow_golem.png"

    aput-object v2, v0, v1

    const/16 v1, 0x298

    const-string v2, "images/mob/cow.png"

    aput-object v2, v0, v1

    const/16 v1, 0x299

    const-string v2, "images/mob/chicken.png"

    aput-object v2, v0, v1

    const/16 v1, 0x29a

    const-string v2, "images/mob/ghast.png"

    aput-object v2, v0, v1

    const/16 v1, 0x29b

    const-string v2, "images/item/chest/double_normal.png"

    aput-object v2, v0, v1

    const/16 v1, 0x29c

    const-string v2, "images/item/chest/normal.png"

    aput-object v2, v0, v1

    const/16 v1, 0x29d

    const-string v2, "images/item/chest/trapped_double.png"

    aput-object v2, v0, v1

    const/16 v1, 0x29e

    const-string v2, "images/item/chest/trapped.png"

    aput-object v2, v0, v1

    const/16 v1, 0x29f

    const-string v2, "images/item/sign.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2a0

    const-string v2, "images/item/tripod_camera.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2a1

    const-string v2, "images/item/arrows.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2a2

    const-string v2, "images/item/screenshot_frame.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2a3

    const-string v2, "images/ingame.images"

    aput-object v2, v0, v1

    const/16 v1, 0x2a4

    const-string v2, "images/entity/experience_orb.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2a5

    const-string v2, "images/entity/minecart.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2a6

    const-string v2, "images/entity/enchanting_table_book.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2a7

    const-string v2, "images/entity/fishhook.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2a8

    const-string v2, "images/entity/boat/boat_acacia.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2a9

    const-string v2, "images/entity/boat/boat_spruce.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2aa

    const-string v2, "images/entity/boat/boat_birch.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2ab

    const-string v2, "images/entity/boat/boat_darkoak.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2ac

    const-string v2, "images/entity/boat/boat_oak.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2ad

    const-string v2, "images/entity/boat/boat_jungle.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2ae

    const-string v2, "images/entity/fireball.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2af

    const-string v2, "images/entity/enchanting_table_book_shadow.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2b0

    const-string v2, "images/terrain-atlas_mip2.tga"

    aput-object v2, v0, v1

    const/16 v1, 0x2b1

    const-string v2, "images/font/glyph_zh-TW_8A.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2b2

    const-string v2, "images/font/glyph_76.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2b3

    const-string v2, "images/font/glyph_ja-JP_43.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2b4

    const-string v2, "images/font/glyph_C0.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2b5

    const-string v2, "images/font/glyph_43.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2b6

    const-string v2, "images/font/glyph_7E.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2b7

    const-string v2, "images/font/glyph_ja-JP_41.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2b8

    const-string v2, "images/font/glyph_83.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2b9

    const-string v2, "images/font/glyph_B0.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2ba

    const-string v2, "images/font/glyph_ja-JP_9E.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2bb

    const-string v2, "images/font/glyph_37.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2bc

    const-string v2, "images/font/glyph_zh-TW_5F.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2bd

    const-string v2, "images/font/glyph_ja-JP_7C.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2be

    const-string v2, "images/font/glyph_ja-JP_62.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2bf

    const-string v2, "images/font/glyph_zh-TW_4E.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2c0

    const-string v2, "images/font/glyph_88.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2c1

    const-string v2, "images/font/glyph_zh-TW_60.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2c2

    const-string v2, "images/font/glyph_ja-JP_8B.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2c3

    const-string v2, "images/font/glyph_ja-JP_46.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2c4

    const-string v2, "images/font/glyph_97.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2c5

    const-string v2, "images/font/glyph_62.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2c6

    const-string v2, "images/font/glyph_zh-TW_64.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2c7

    const-string v2, "images/font/glyph_4E.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2c8

    const-string v2, "images/font/glyph_AF.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2c9

    const-string v2, "images/font/glyph_48.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2ca

    const-string v2, "images/font/glyph_1B.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2cb

    const-string v2, "images/font/glyph_ja-JP_7D.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2cc

    const-string v2, "images/font/glyph_03.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2cd

    const-string v2, "images/font/glyph_17.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2ce

    const-string v2, "images/font/glyph_6D.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2cf

    const-string v2, "images/font/glyph_ja-JP_5B.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2d0

    const-string v2, "images/font/glyph_59.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2d1

    const-string v2, "images/font/glyph_1E.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2d2

    const-string v2, "images/font/glyph_8D.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2d3

    const-string v2, "images/font/glyph_B1.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2d4

    const-string v2, "images/font/glyph_BD.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2d5

    const-string v2, "images/font/glyph_06.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2d6

    const-string v2, "images/font/glyph_01.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2d7

    const-string v2, "images/font/glyph_ja-JP_4B.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2d8

    const-string v2, "images/font/glyph_zh-TW_7D.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2d9

    const-string v2, "images/font/glyph_29.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2da

    const-string v2, "images/font/glyph_zh-TW_42.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2db

    const-string v2, "images/font/glyph_sizes.bin"

    aput-object v2, v0, v1

    const/16 v1, 0x2dc

    const-string v2, "images/font/glyph_ja-JP_9A.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2dd

    const-string v2, "images/font/glyph_ja-JP_5E.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2de

    const-string v2, "images/font/glyph_27.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2df

    const-string v2, "images/font/glyph_zh-TW_83.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2e0

    const-string v2, "images/font/glyph_ja-JP_57.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2e1

    const-string v2, "images/font/glyph_zh-TW_44.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2e2

    const-string v2, "images/font/glyph_FA.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2e3

    const-string v2, "images/font/glyph_zh-TW_5E.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2e4

    const-string v2, "images/font/glyph_16.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2e5

    const-string v2, "images/font/glyph_zh-TW_52.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2e6

    const-string v2, "images/font/glyph_zh-TW_7B.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2e7

    const-string v2, "images/font/glyph_ja-JP_74.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2e8

    const-string v2, "images/font/glyph_zh-TW_87.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2e9

    const-string v2, "images/font/glyph_CE.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2ea

    const-string v2, "images/font/glyph_zh-TW_6C.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2eb

    const-string v2, "images/font/glyph_zh-TW_62.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2ec

    const-string v2, "images/font/glyph_ja-JP_89.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2ed

    const-string v2, "images/font/glyph_zh-TW_9E.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2ee

    const-string v2, "images/font/glyph_A1.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2ef

    const-string v2, "images/font/glyph_zh-TW_75.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2f0

    const-string v2, "images/font/glyph_ja-JP_7E.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2f1

    const-string v2, "images/font/glyph_ja-JP_35.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2f2

    const-string v2, "images/font/glyph_zh-TW_2E.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2f3

    const-string v2, "images/font/glyph_ja-JP_64.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2f4

    const-string v2, "images/font/glyph_ja-JP_FA.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2f5

    const-string v2, "images/font/glyph_ja-JP_5F.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2f6

    const-string v2, "images/font/glyph_52.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2f7

    const-string v2, "images/font/glyph_89.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2f8

    const-string v2, "images/font/glyph_9D.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2f9

    const-string v2, "images/font/glyph_ja-JP_50.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2fa

    const-string v2, "images/font/glyph_54.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2fb

    const-string v2, "images/font/glyph_AD.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2fc

    const-string v2, "images/font/glyph_zh-TW_3C.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2fd

    const-string v2, "images/font/glyph_AE.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2fe

    const-string v2, "images/font/glyph_zh-TW_85.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2ff

    const-string v2, "images/font/glyph_BF.png"

    aput-object v2, v0, v1

    const/16 v1, 0x300

    const-string v2, "images/font/glyph_ja-JP_55.png"

    aput-object v2, v0, v1

    const/16 v1, 0x301

    const-string v2, "images/font/glyph_ja-JP_86.png"

    aput-object v2, v0, v1

    const/16 v1, 0x302

    const-string v2, "images/font/glyph_ja-JP_F9.png"

    aput-object v2, v0, v1

    const/16 v1, 0x303

    const-string v2, "images/font/glyph_C3.png"

    aput-object v2, v0, v1

    const/16 v1, 0x304

    const-string v2, "images/font/glyph_zh-TW_7A.png"

    aput-object v2, v0, v1

    const/16 v1, 0x305

    const-string v2, "images/font/glyph_zh-TW_48.png"

    aput-object v2, v0, v1

    const/16 v1, 0x306

    const-string v2, "images/font/glyph_1A.png"

    aput-object v2, v0, v1

    const/16 v1, 0x307

    const-string v2, "images/font/glyph_3F.png"

    aput-object v2, v0, v1

    const/16 v1, 0x308

    const-string v2, "images/font/glyph_65.png"

    aput-object v2, v0, v1

    const/16 v1, 0x309

    const-string v2, "images/font/glyph_C4.png"

    aput-object v2, v0, v1

    const/16 v1, 0x30a

    const-string v2, "images/font/glyph_ja-JP_5C.png"

    aput-object v2, v0, v1

    const/16 v1, 0x30b

    const-string v2, "images/font/glyph_ja-JP_63.png"

    aput-object v2, v0, v1

    const/16 v1, 0x30c

    const-string v2, "images/font/glyph_9E.png"

    aput-object v2, v0, v1

    const/16 v1, 0x30d

    const-string v2, "images/font/glyph_A9.png"

    aput-object v2, v0, v1

    const/16 v1, 0x30e

    const-string v2, "images/font/glyph_ja-JP_2F.png"

    aput-object v2, v0, v1

    const/16 v1, 0x30f

    const-string v2, "images/font/glyph_6F.png"

    aput-object v2, v0, v1

    const/16 v1, 0x310

    const-string v2, "images/font/glyph_ja-JP_FF.png"

    aput-object v2, v0, v1

    const/16 v1, 0x311

    const-string v2, "images/font/glyph_ja-JP_40.png"

    aput-object v2, v0, v1

    const/16 v1, 0x312

    const-string v2, "images/font/glyph_64.png"

    aput-object v2, v0, v1

    const/16 v1, 0x313

    const-string v2, "images/font/glyph_3D.png"

    aput-object v2, v0, v1

    const/16 v1, 0x314

    const-string v2, "images/font/glyph_ja-JP_91.png"

    aput-object v2, v0, v1

    const/16 v1, 0x315

    const-string v2, "images/font/glyph_C1.png"

    aput-object v2, v0, v1

    const/16 v1, 0x316

    const-string v2, "images/font/glyph_68.png"

    aput-object v2, v0, v1

    const/16 v1, 0x317

    const-string v2, "images/font/glyph_FD.png"

    aput-object v2, v0, v1

    const/16 v1, 0x318

    const-string v2, "images/font/glyph_zh-TW_90.png"

    aput-object v2, v0, v1

    const/16 v1, 0x319

    const-string v2, "images/font/glyph_63.png"

    aput-object v2, v0, v1

    const/16 v1, 0x31a

    const-string v2, "images/font/glyph_zh-TW_77.png"

    aput-object v2, v0, v1

    const/16 v1, 0x31b

    const-string v2, "images/font/glyph_zh-TW_53.png"

    aput-object v2, v0, v1

    const/16 v1, 0x31c

    const-string v2, "images/font/glyph_07.png"

    aput-object v2, v0, v1

    const/16 v1, 0x31d

    const-string v2, "images/font/glyph_0C.png"

    aput-object v2, v0, v1

    const/16 v1, 0x31e

    const-string v2, "images/font/glyph_CB.png"

    aput-object v2, v0, v1

    const/16 v1, 0x31f

    const-string v2, "images/font/glyph_8B.png"

    aput-object v2, v0, v1

    const/16 v1, 0x320

    const-string v2, "images/font/glyph_ja-JP_6C.png"

    aput-object v2, v0, v1

    const/16 v1, 0x321

    const-string v2, "images/font/glyph_zh-TW_FF.png"

    aput-object v2, v0, v1

    const/16 v1, 0x322

    const-string v2, "images/font/glyph_zh-TW_7F.png"

    aput-object v2, v0, v1

    const/16 v1, 0x323

    const-string v2, "images/font/glyph_ja-JP_54.png"

    aput-object v2, v0, v1

    const/16 v1, 0x324

    const-string v2, "images/font/glyph_18.png"

    aput-object v2, v0, v1

    const/16 v1, 0x325

    const-string v2, "images/font/glyph_ja-JP_38.png"

    aput-object v2, v0, v1

    const/16 v1, 0x326

    const-string v2, "images/font/glyph_7F.png"

    aput-object v2, v0, v1

    const/16 v1, 0x327

    const-string v2, "images/font/glyph_95.png"

    aput-object v2, v0, v1

    const/16 v1, 0x328

    const-string v2, "images/font/glyph_D6.png"

    aput-object v2, v0, v1

    const/16 v1, 0x329

    const-string v2, "images/font/glyph_D1.png"

    aput-object v2, v0, v1

    const/16 v1, 0x32a

    const-string v2, "images/font/glyph_zh-TW_74.png"

    aput-object v2, v0, v1

    const/16 v1, 0x32b

    const-string v2, "images/font/glyph_4C.png"

    aput-object v2, v0, v1

    const/16 v1, 0x32c

    const-string v2, "images/font/glyph_zh-TW_51.png"

    aput-object v2, v0, v1

    const/16 v1, 0x32d

    const-string v2, "images/font/glyph_6B.png"

    aput-object v2, v0, v1

    const/16 v1, 0x32e

    const-string v2, "images/font/glyph_8F.png"

    aput-object v2, v0, v1

    const/16 v1, 0x32f

    const-string v2, "images/font/glyph_45.png"

    aput-object v2, v0, v1

    const/16 v1, 0x330

    const-string v2, "images/font/glyph_zh-TW_70.png"

    aput-object v2, v0, v1

    const/16 v1, 0x331

    const-string v2, "images/font/glyph_ja-JP_9F.png"

    aput-object v2, v0, v1

    const/16 v1, 0x332

    const-string v2, "images/font/glyph_FE.png"

    aput-object v2, v0, v1

    const/16 v1, 0x333

    const-string v2, "images/font/glyph_zh-TW_7E.png"

    aput-object v2, v0, v1

    const/16 v1, 0x334

    const-string v2, "images/font/glyph_ja-JP_4C.png"

    aput-object v2, v0, v1

    const/16 v1, 0x335

    const-string v2, "images/font/glyph_ja-JP_60.png"

    aput-object v2, v0, v1

    const/16 v1, 0x336

    const-string v2, "images/font/glyph_ja-JP_8A.png"

    aput-object v2, v0, v1

    const/16 v1, 0x337

    const-string v2, "images/font/glyph_ja-JP_72.png"

    aput-object v2, v0, v1

    const/16 v1, 0x338

    const-string v2, "images/font/glyph_zh-TW_96.png"

    aput-object v2, v0, v1

    const/16 v1, 0x339

    const-string v2, "images/font/glyph_zh-TW_98.png"

    aput-object v2, v0, v1

    const/16 v1, 0x33a

    const-string v2, "images/font/glyph_A8.png"

    aput-object v2, v0, v1

    const/16 v1, 0x33b

    const-string v2, "images/font/glyph_ja-JP_92.png"

    aput-object v2, v0, v1

    const/16 v1, 0x33c

    const-string v2, "images/font/glyph_B6.png"

    aput-object v2, v0, v1

    const/16 v1, 0x33d

    const-string v2, "images/font/glyph_5C.png"

    aput-object v2, v0, v1

    const/16 v1, 0x33e

    const-string v2, "images/font/glyph_85.png"

    aput-object v2, v0, v1

    const/16 v1, 0x33f

    const-string v2, "images/font/glyph_39.png"

    aput-object v2, v0, v1

    const/16 v1, 0x340

    const-string v2, "images/font/glyph_ja-JP_FD.png"

    aput-object v2, v0, v1

    const/16 v1, 0x341

    const-string v2, "images/font/glyph_ja-JP_68.png"

    aput-object v2, v0, v1

    const/16 v1, 0x342

    const-string v2, "images/font/glyph_ja-JP_4F.png"

    aput-object v2, v0, v1

    const/16 v1, 0x343

    const-string v2, "images/font/glyph_ja-JP_31.png"

    aput-object v2, v0, v1

    const/16 v1, 0x344

    const-string v2, "images/font/glyph_zh-TW_36.png"

    aput-object v2, v0, v1

    const/16 v1, 0x345

    const-string v2, "images/font/glyph_zh-TW_39.png"

    aput-object v2, v0, v1

    const/16 v1, 0x346

    const-string v2, "images/font/glyph_46.png"

    aput-object v2, v0, v1

    const/16 v1, 0x347

    const-string v2, "images/font/glyph_ja-JP_FE.png"

    aput-object v2, v0, v1

    const/16 v1, 0x348

    const-string v2, "images/font/glyph_D0.png"

    aput-object v2, v0, v1

    const/16 v1, 0x349

    const-string v2, "images/font/glyph_zh-TW_56.png"

    aput-object v2, v0, v1

    const/16 v1, 0x34a

    const-string v2, "images/font/glyph_zh-TW_30.png"

    aput-object v2, v0, v1

    const/16 v1, 0x34b

    const-string v2, "images/font/glyph_A2.png"

    aput-object v2, v0, v1

    const/16 v1, 0x34c

    const-string v2, "images/font/glyph_81.png"

    aput-object v2, v0, v1

    const/16 v1, 0x34d

    const-string v2, "images/font/glyph_ja-JP_FB.png"

    aput-object v2, v0, v1

    const/16 v1, 0x34e

    const-string v2, "images/font/glyph_zh-TW_6F.png"

    aput-object v2, v0, v1

    const/16 v1, 0x34f

    const-string v2, "images/font/glyph_zh-TW_3B.png"

    aput-object v2, v0, v1

    const/16 v1, 0x350

    const-string v2, "images/font/glyph_26.png"

    aput-object v2, v0, v1

    const/16 v1, 0x351

    const-string v2, "images/font/glyph_ja-JP_4A.png"

    aput-object v2, v0, v1

    const/16 v1, 0x352

    const-string v2, "images/font/glyph_50.png"

    aput-object v2, v0, v1

    const/16 v1, 0x353

    const-string v2, "images/font/glyph_ja-JP_56.png"

    aput-object v2, v0, v1

    const/16 v1, 0x354

    const-string v2, "images/font/glyph_1C.png"

    aput-object v2, v0, v1

    const/16 v1, 0x355

    const-string v2, "images/font/glyph_zh-TW_67.png"

    aput-object v2, v0, v1

    const/16 v1, 0x356

    const-string v2, "images/font/glyph_C5.png"

    aput-object v2, v0, v1

    const/16 v1, 0x357

    const-string v2, "images/font/glyph_ja-JP_3E.png"

    aput-object v2, v0, v1

    const/16 v1, 0x358

    const-string v2, "images/font/glyph_ja-JP_49.png"

    aput-object v2, v0, v1

    const/16 v1, 0x359

    const-string v2, "images/font/glyph_B3.png"

    aput-object v2, v0, v1

    const/16 v1, 0x35a

    const-string v2, "images/font/glyph_4F.png"

    aput-object v2, v0, v1

    const/16 v1, 0x35b

    const-string v2, "images/font/glyph_2C.png"

    aput-object v2, v0, v1

    const/16 v1, 0x35c

    const-string v2, "images/font/glyph_ja-JP_36.png"

    aput-object v2, v0, v1

    const/16 v1, 0x35d

    const-string v2, "images/font/glyph_ja-JP_3D.png"

    aput-object v2, v0, v1

    const/16 v1, 0x35e

    const-string v2, "images/font/glyph_F9.png"

    aput-object v2, v0, v1

    const/16 v1, 0x35f

    const-string v2, "images/font/glyph_zh-TW_58.png"

    aput-object v2, v0, v1

    const/16 v1, 0x360

    const-string v2, "images/font/glyph_zh-TW_3A.png"

    aput-object v2, v0, v1

    const/16 v1, 0x361

    const-string v2, "images/font/glyph_ja-JP_61.png"

    aput-object v2, v0, v1

    const/16 v1, 0x362

    const-string v2, "images/font/glyph_8E.png"

    aput-object v2, v0, v1

    const/16 v1, 0x363

    const-string v2, "images/font/glyph_ja-JP_83.png"

    aput-object v2, v0, v1

    const/16 v1, 0x364

    const-string v2, "images/font/glyph_5D.png"

    aput-object v2, v0, v1

    const/16 v1, 0x365

    const-string v2, "images/font/glyph_7D.png"

    aput-object v2, v0, v1

    const/16 v1, 0x366

    const-string v2, "images/font/glyph_zh-TW_6A.png"

    aput-object v2, v0, v1

    const/16 v1, 0x367

    const-string v2, "images/font/glyph_ja-JP_78.png"

    aput-object v2, v0, v1

    const/16 v1, 0x368

    const-string v2, "images/font/glyph_zh-TW_45.png"

    aput-object v2, v0, v1

    const/16 v1, 0x369

    const-string v2, "images/font/glyph_ja-JP_82.png"

    aput-object v2, v0, v1

    const/16 v1, 0x36a

    const-string v2, "images/font/glyph_ja-JP_79.png"

    aput-object v2, v0, v1

    const/16 v1, 0x36b

    const-string v2, "images/font/glyph_B7.png"

    aput-object v2, v0, v1

    const/16 v1, 0x36c

    const-string v2, "images/font/glyph_BB.png"

    aput-object v2, v0, v1

    const/16 v1, 0x36d

    const-string v2, "images/font/glyph_ja-JP_3C.png"

    aput-object v2, v0, v1

    const/16 v1, 0x36e

    const-string v2, "images/font/glyph_ja-JP_8D.png"

    aput-object v2, v0, v1

    const/16 v1, 0x36f

    const-string v2, "images/font/glyph_zh-TW_43.png"

    aput-object v2, v0, v1

    const/16 v1, 0x370

    const-string v2, "images/font/glyph_ja-JP_37.png"

    aput-object v2, v0, v1

    const/16 v1, 0x371

    const-string v2, "images/font/glyph_ja-JP_93.png"

    aput-object v2, v0, v1

    const/16 v1, 0x372

    const-string v2, "images/font/glyph_0B.png"

    aput-object v2, v0, v1

    const/16 v1, 0x373

    const-string v2, "images/font/glyph_7A.png"

    aput-object v2, v0, v1

    const/16 v1, 0x374

    const-string v2, "images/font/glyph_zh-TW_8E.png"

    aput-object v2, v0, v1

    const/16 v1, 0x375

    const-string v2, "images/font/glyph_21.png"

    aput-object v2, v0, v1

    const/16 v1, 0x376

    const-string v2, "images/font/glyph_ja-JP_75.png"

    aput-object v2, v0, v1

    const/16 v1, 0x377

    const-string v2, "images/font/glyph_zh-TW_FA.png"

    aput-object v2, v0, v1

    const/16 v1, 0x378

    const-string v2, "images/font/glyph_zh-TW_73.png"

    aput-object v2, v0, v1

    const/16 v1, 0x379

    const-string v2, "images/font/glyph_84.png"

    aput-object v2, v0, v1

    const/16 v1, 0x37a

    const-string v2, "images/font/glyph_CD.png"

    aput-object v2, v0, v1

    const/16 v1, 0x37b

    const-string v2, "images/font/glyph_ja-JP_3B.png"

    aput-object v2, v0, v1

    const/16 v1, 0x37c

    const-string v2, "images/font/glyph_ja-JP_95.png"

    aput-object v2, v0, v1

    const/16 v1, 0x37d

    const-string v2, "images/font/glyph_ja-JP_76.png"

    aput-object v2, v0, v1

    const/16 v1, 0x37e

    const-string v2, "images/font/glyph_ja-JP_5D.png"

    aput-object v2, v0, v1

    const/16 v1, 0x37f

    const-string v2, "images/font/glyph_zh-TW_6D.png"

    aput-object v2, v0, v1

    const/16 v1, 0x380

    const-string v2, "images/font/glyph_CF.png"

    aput-object v2, v0, v1

    const/16 v1, 0x381

    const-string v2, "images/font/glyph_80.png"

    aput-object v2, v0, v1

    const/16 v1, 0x382

    const-string v2, "images/font/glyph_35.png"

    aput-object v2, v0, v1

    const/16 v1, 0x383

    const-string v2, "images/font/glyph_38.png"

    aput-object v2, v0, v1

    const/16 v1, 0x384

    const-string v2, "images/font/glyph_ja-JP_66.png"

    aput-object v2, v0, v1

    const/16 v1, 0x385

    const-string v2, "images/font/glyph_zh-TW_2F.png"

    aput-object v2, v0, v1

    const/16 v1, 0x386

    const-string v2, "images/font/glyph_zh-TW_8B.png"

    aput-object v2, v0, v1

    const/16 v1, 0x387

    const-string v2, "images/font/glyph_zh-TW_7C.png"

    aput-object v2, v0, v1

    const/16 v1, 0x388

    const-string v2, "images/font/glyph_4D.png"

    aput-object v2, v0, v1

    const/16 v1, 0x389

    const-string v2, "images/font/glyph_2B.png"

    aput-object v2, v0, v1

    const/16 v1, 0x38a

    const-string v2, "images/font/glyph_2A.png"

    aput-object v2, v0, v1

    const/16 v1, 0x38b

    const-string v2, "images/font/glyph_ja-JP_90.png"

    aput-object v2, v0, v1

    const/16 v1, 0x38c

    const-string v2, "images/font/glyph_zh-TW_F9.png"

    aput-object v2, v0, v1

    const/16 v1, 0x38d

    const-string v2, "images/font/glyph_zh-TW_31.png"

    aput-object v2, v0, v1

    const/16 v1, 0x38e

    const-string v2, "images/font/glyph_9B.png"

    aput-object v2, v0, v1

    const/16 v1, 0x38f

    const-string v2, "images/font/glyph_5B.png"

    aput-object v2, v0, v1

    const/16 v1, 0x390

    const-string v2, "images/font/glyph_zh-TW_41.png"

    aput-object v2, v0, v1

    const/16 v1, 0x391

    const-string v2, "images/font/glyph_4B.png"

    aput-object v2, v0, v1

    const/16 v1, 0x392

    const-string v2, "images/font/glyph_B2.png"

    aput-object v2, v0, v1

    const/16 v1, 0x393

    const-string v2, "images/font/glyph_73.png"

    aput-object v2, v0, v1

    const/16 v1, 0x394

    const-string v2, "images/font/glyph_A5.png"

    aput-object v2, v0, v1

    const/16 v1, 0x395

    const-string v2, "images/font/glyph_40.png"

    aput-object v2, v0, v1

    const/16 v1, 0x396

    const-string v2, "images/font/glyph_A4.png"

    aput-object v2, v0, v1

    const/16 v1, 0x397

    const-string v2, "images/font/glyph_C8.png"

    aput-object v2, v0, v1

    const/16 v1, 0x398

    const-string v2, "images/font/glyph_ja-JP_32.png"

    aput-object v2, v0, v1

    const/16 v1, 0x399

    const-string v2, "images/font/glyph_36.png"

    aput-object v2, v0, v1

    const/16 v1, 0x39a

    const-string v2, "images/font/glyph_78.png"

    aput-object v2, v0, v1

    const/16 v1, 0x39b

    const-string v2, "images/font/glyph_zh-TW_4F.png"

    aput-object v2, v0, v1

    const/16 v1, 0x39c

    const-string v2, "images/font/glyph_98.png"

    aput-object v2, v0, v1

    const/16 v1, 0x39d

    const-string v2, "images/font/glyph_zh-TW_68.png"

    aput-object v2, v0, v1

    const/16 v1, 0x39e

    const-string v2, "images/font/glyph_zh-TW_FE.png"

    aput-object v2, v0, v1

    const/16 v1, 0x39f

    const-string v2, "images/font/glyph_72.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3a0

    const-string v2, "images/font/glyph_ja-JP_30.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3a1

    const-string v2, "images/font/glyph_zh-TW_4B.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3a2

    const-string v2, "images/font/glyph_47.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3a3

    const-string v2, "images/font/glyph_5F.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3a4

    const-string v2, "images/font/glyph_ja-JP_8C.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3a5

    const-string v2, "images/font/glyph_2D.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3a6

    const-string v2, "images/font/glyph_ja-JP_69.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3a7

    const-string v2, "images/font/glyph_D7.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3a8

    const-string v2, "images/font/glyph_zh-TW_3E.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3a9

    const-string v2, "images/font/glyph_ja-JP_99.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3aa

    const-string v2, "images/font/glyph_ja-JP_47.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3ab

    const-string v2, "images/font/glyph_74.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3ac

    const-string v2, "images/font/glyph_zh-TW_59.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3ad

    const-string v2, "images/font/glyph_zh-TW_46.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3ae

    const-string v2, "images/font/glyph_zh-TW_35.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3af

    const-string v2, "images/font/glyph_ja-JP_51.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3b0

    const-string v2, "images/font/glyph_zh-TW_5B.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3b1

    const-string v2, "images/font/glyph_ja-JP_73.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3b2

    const-string v2, "images/font/glyph_7B.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3b3

    const-string v2, "images/font/glyph_53.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3b4

    const-string v2, "images/font/glyph_30.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3b5

    const-string v2, "images/font/glyph_B5.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3b6

    const-string v2, "images/font/glyph_D4.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3b7

    const-string v2, "images/font/glyph_ja-JP_98.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3b8

    const-string v2, "images/font/glyph_zh-TW_71.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3b9

    const-string v2, "images/font/glyph_4A.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3ba

    const-string v2, "images/font/glyph_A6.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3bb

    const-string v2, "images/font/glyph_A0.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3bc

    const-string v2, "images/font/glyph_42.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3bd

    const-string v2, "images/font/glyph_AB.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3be

    const-string v2, "images/font/glyph_ja-JP_85.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3bf

    const-string v2, "images/font/glyph_33.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3c0

    const-string v2, "images/font/glyph_zh-TW_6E.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3c1

    const-string v2, "images/font/glyph_BE.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3c2

    const-string v2, "images/font/glyph_ja-JP_6E.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3c3

    const-string v2, "images/font/glyph_23.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3c4

    const-string v2, "images/font/glyph_zh-TW_47.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3c5

    const-string v2, "images/font/glyph_ja-JP_53.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3c6

    const-string v2, "images/font/glyph_8C.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3c7

    const-string v2, "images/font/glyph_14.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3c8

    const-string v2, "images/font/glyph_A3.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3c9

    const-string v2, "images/font/glyph_zh-TW_86.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3ca

    const-string v2, "images/font/glyph_zh-TW_94.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3cb

    const-string v2, "images/font/glyph_19.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3cc

    const-string v2, "images/font/glyph_ja-JP_94.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3cd

    const-string v2, "images/font/glyph_C6.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3ce

    const-string v2, "images/font/glyph_ja-JP_7B.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3cf

    const-string v2, "images/font/glyph_51.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3d0

    const-string v2, "images/font/glyph_11.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3d1

    const-string v2, "images/font/glyph_zh-TW_5C.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3d2

    const-string v2, "images/font/glyph_7C.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3d3

    const-string v2, "images/font/glyph_ja-JP_48.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3d4

    const-string v2, "images/font/glyph_9F.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3d5

    const-string v2, "images/font/glyph_25.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3d6

    const-string v2, "images/font/glyph_6A.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3d7

    const-string v2, "images/font/glyph_61.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3d8

    const-string v2, "images/font/glyph_09.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3d9

    const-string v2, "images/font/glyph_94.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3da

    const-string v2, "images/font/glyph_ja-JP_4E.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3db

    const-string v2, "images/font/glyph_zh-TW_49.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3dc

    const-string v2, "images/font/glyph_zh-TW_54.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3dd

    const-string v2, "images/font/glyph_ja-JP_3A.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3de

    const-string v2, "images/font/glyph_91.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3df

    const-string v2, "images/font/glyph_ja-JP_6B.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3e0

    const-string v2, "images/font/glyph_zh-TW_33.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3e1

    const-string v2, "images/font/glyph_A7.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3e2

    const-string v2, "images/font/glyph_57.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3e3

    const-string v2, "images/font/glyph_B4.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3e4

    const-string v2, "images/font/glyph_zh-TW_5A.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3e5

    const-string v2, "images/font/glyph_87.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3e6

    const-string v2, "images/font/glyph_zh-TW_5D.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3e7

    const-string v2, "images/font/glyph_BC.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3e8

    const-string v2, "images/font/glyph_13.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3e9

    const-string v2, "images/font/glyph_9C.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3ea

    const-string v2, "images/font/glyph_3E.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3eb

    const-string v2, "images/font/glyph_D2.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3ec

    const-string v2, "images/font/glyph_2E.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3ed

    const-string v2, "images/font/glyph_58.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3ee

    const-string v2, "images/font/glyph_66.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3ef

    const-string v2, "images/font/glyph_zh-TW_57.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3f0

    const-string v2, "images/font/glyph_ja-JP_3F.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3f1

    const-string v2, "images/font/glyph_ja-JP_70.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3f2

    const-string v2, "images/font/glyph_zh-TW_97.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3f3

    const-string v2, "images/font/glyph_ja-JP_9B.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3f4

    const-string v2, "images/font/glyph_2F.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3f5

    const-string v2, "images/font/glyph_zh-TW_82.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3f6

    const-string v2, "images/font/glyph_70.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3f7

    const-string v2, "images/font/glyph_zh-TW_80.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3f8

    const-string v2, "images/font/glyph_34.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3f9

    const-string v2, "images/font/glyph_zh-TW_81.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3fa

    const-string v2, "images/font/glyph_zh-TW_34.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3fb

    const-string v2, "images/font/glyph_ja-JP_59.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3fc

    const-string v2, "images/font/glyph_3A.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3fd

    const-string v2, "images/font/glyph_3B.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3fe

    const-string v2, "images/font/glyph_ja-JP_7F.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3ff

    const-string v2, "images/font/glyph_zh-TW_9D.png"

    aput-object v2, v0, v1

    const/16 v1, 0x400

    const-string v2, "images/font/glyph_90.png"

    aput-object v2, v0, v1

    const/16 v1, 0x401

    const-string v2, "images/font/glyph_0A.png"

    aput-object v2, v0, v1

    const/16 v1, 0x402

    const-string v2, "images/font/glyph_69.png"

    aput-object v2, v0, v1

    const/16 v1, 0x403

    const-string v2, "images/font/glyph_49.png"

    aput-object v2, v0, v1

    const/16 v1, 0x404

    const-string v2, "images/font/glyph_3C.png"

    aput-object v2, v0, v1

    const/16 v1, 0x405

    const-string v2, "images/font/glyph_77.png"

    aput-object v2, v0, v1

    const/16 v1, 0x406

    const-string v2, "images/font/glyph_zh-TW_99.png"

    aput-object v2, v0, v1

    const/16 v1, 0x407

    const-string v2, "images/font/glyph_41.png"

    aput-object v2, v0, v1

    const/16 v1, 0x408

    const-string v2, "images/font/glyph_ja-JP_9D.png"

    aput-object v2, v0, v1

    const/16 v1, 0x409

    const-string v2, "images/font/glyph_6E.png"

    aput-object v2, v0, v1

    const/16 v1, 0x40a

    const-string v2, "images/font/glyph_FF.png"

    aput-object v2, v0, v1

    const/16 v1, 0x40b

    const-string v2, "images/font/glyph_C2.png"

    aput-object v2, v0, v1

    const/16 v1, 0x40c

    const-string v2, "images/font/glyph_zh-TW_84.png"

    aput-object v2, v0, v1

    const/16 v1, 0x40d

    const-string v2, "images/font/glyph_zh-TW_61.png"

    aput-object v2, v0, v1

    const/16 v1, 0x40e

    const-string v2, "images/font/glyph_ja-JP_4D.png"

    aput-object v2, v0, v1

    const/16 v1, 0x40f

    const-string v2, "images/font/ascii_sga.png"

    aput-object v2, v0, v1

    const/16 v1, 0x410

    const-string v2, "images/font/glyph_zh-TW_76.png"

    aput-object v2, v0, v1

    const/16 v1, 0x411

    const-string v2, "images/font/glyph_20.png"

    aput-object v2, v0, v1

    const/16 v1, 0x412

    const-string v2, "images/font/glyph_00.png"

    aput-object v2, v0, v1

    const/16 v1, 0x413

    const-string v2, "images/font/glyph_zh-TW_8F.png"

    aput-object v2, v0, v1

    const/16 v1, 0x414

    const-string v2, "images/font/glyph_ja-JP_6D.png"

    aput-object v2, v0, v1

    const/16 v1, 0x415

    const-string v2, "images/font/glyph_ja-JP_80.png"

    aput-object v2, v0, v1

    const/16 v1, 0x416

    const-string v2, "images/font/glyph_1D.png"

    aput-object v2, v0, v1

    const/16 v1, 0x417

    const-string v2, "images/font/glyph_32.png"

    aput-object v2, v0, v1

    const/16 v1, 0x418

    const-string v2, "images/font/glyph_75.png"

    aput-object v2, v0, v1

    const/16 v1, 0x419

    const-string v2, "images/font/glyph_71.png"

    aput-object v2, v0, v1

    const/16 v1, 0x41a

    const-string v2, "images/font/glyph_zh-TW_65.png"

    aput-object v2, v0, v1

    const/16 v1, 0x41b

    const-string v2, "images/font/glyph_0F.png"

    aput-object v2, v0, v1

    const/16 v1, 0x41c

    const-string v2, "images/font/glyph_B8.png"

    aput-object v2, v0, v1

    const/16 v1, 0x41d

    const-string v2, "images/font/glyph_zh-TW_69.png"

    aput-object v2, v0, v1

    const/16 v1, 0x41e

    const-string v2, "images/font/glyph_zh-TW_93.png"

    aput-object v2, v0, v1

    const/16 v1, 0x41f

    const-string v2, "images/font/glyph_ja-JP_84.png"

    aput-object v2, v0, v1

    const/16 v1, 0x420

    const-string v2, "images/font/glyph_86.png"

    aput-object v2, v0, v1

    const/16 v1, 0x421

    const-string v2, "images/font/glyph_22.png"

    aput-object v2, v0, v1

    const/16 v1, 0x422

    const-string v2, "images/font/glyph_ja-JP_97.png"

    aput-object v2, v0, v1

    const/16 v1, 0x423

    const-string v2, "images/font/glyph_ja-JP_6F.png"

    aput-object v2, v0, v1

    const/16 v1, 0x424

    const-string v2, "images/font/glyph_zh-TW_9B.png"

    aput-object v2, v0, v1

    const/16 v1, 0x425

    const-string v2, "images/font/glyph_AA.png"

    aput-object v2, v0, v1

    const/16 v1, 0x426

    const-string v2, "images/font/glyph_93.png"

    aput-object v2, v0, v1

    const/16 v1, 0x427

    const-string v2, "images/font/glyph_zh-TW_38.png"

    aput-object v2, v0, v1

    const/16 v1, 0x428

    const-string v2, "images/font/glyph_C7.png"

    aput-object v2, v0, v1

    const/16 v1, 0x429

    const-string v2, "images/font/glyph_ja-JP_7A.png"

    aput-object v2, v0, v1

    const/16 v1, 0x42a

    const-string v2, "images/font/glyph_ja-JP_71.png"

    aput-object v2, v0, v1

    const/16 v1, 0x42b

    const-string v2, "images/font/glyph_44.png"

    aput-object v2, v0, v1

    const/16 v1, 0x42c

    const-string v2, "images/font/glyph_B9.png"

    aput-object v2, v0, v1

    const/16 v1, 0x42d

    const-string v2, "images/font/glyph_zh-TW_88.png"

    aput-object v2, v0, v1

    const/16 v1, 0x42e

    const-string v2, "images/font/glyph_96.png"

    aput-object v2, v0, v1

    const/16 v1, 0x42f

    const-string v2, "images/font/glyph_zh-TW_32.png"

    aput-object v2, v0, v1

    const/16 v1, 0x430

    const-string v2, "images/font/glyph_ja-JP_44.png"

    aput-object v2, v0, v1

    const/16 v1, 0x431

    const-string v2, "images/font/glyph_10.png"

    aput-object v2, v0, v1

    const/16 v1, 0x432

    const-string v2, "images/font/glyph_zh-TW_89.png"

    aput-object v2, v0, v1

    const/16 v1, 0x433

    const-string v2, "images/font/glyph_12.png"

    aput-object v2, v0, v1

    const/16 v1, 0x434

    const-string v2, "images/font/glyph_zh-TW_37.png"

    aput-object v2, v0, v1

    const/16 v1, 0x435

    const-string v2, "images/font/glyph_FC.png"

    aput-object v2, v0, v1

    const/16 v1, 0x436

    const-string v2, "images/font/glyph_ja-JP_8F.png"

    aput-object v2, v0, v1

    const/16 v1, 0x437

    const-string v2, "images/font/glyph_60.png"

    aput-object v2, v0, v1

    const/16 v1, 0x438

    const-string v2, "images/font/glyph_zh-TW_72.png"

    aput-object v2, v0, v1

    const/16 v1, 0x439

    const-string v2, "images/font/glyph_zh-TW_9F.png"

    aput-object v2, v0, v1

    const/16 v1, 0x43a

    const-string v2, "images/font/glyph_zh-TW_92.png"

    aput-object v2, v0, v1

    const/16 v1, 0x43b

    const-string v2, "images/font/glyph_zh-TW_91.png"

    aput-object v2, v0, v1

    const/16 v1, 0x43c

    const-string v2, "images/font/glyph_15.png"

    aput-object v2, v0, v1

    const/16 v1, 0x43d

    const-string v2, "images/font/glyph_9A.png"

    aput-object v2, v0, v1

    const/16 v1, 0x43e

    const-string v2, "images/font/glyph_CC.png"

    aput-object v2, v0, v1

    const/16 v1, 0x43f

    const-string v2, "images/font/glyph_02.png"

    aput-object v2, v0, v1

    const/16 v1, 0x440

    const-string v2, "images/font/glyph_zh-TW_4D.png"

    aput-object v2, v0, v1

    const/16 v1, 0x441

    const-string v2, "images/font/glyph_zh-TW_9A.png"

    aput-object v2, v0, v1

    const/16 v1, 0x442

    const-string v2, "images/font/glyph_zh-TW_8C.png"

    aput-object v2, v0, v1

    const/16 v1, 0x443

    const-string v2, "images/font/glyph_5A.png"

    aput-object v2, v0, v1

    const/16 v1, 0x444

    const-string v2, "images/font/glyph_BA.png"

    aput-object v2, v0, v1

    const/16 v1, 0x445

    const-string v2, "images/font/glyph_zh-TW_6B.png"

    aput-object v2, v0, v1

    const/16 v1, 0x446

    const-string v2, "images/font/glyph_6C.png"

    aput-object v2, v0, v1

    const/16 v1, 0x447

    const-string v2, "images/font/glyph_ja-JP_33.png"

    aput-object v2, v0, v1

    const/16 v1, 0x448

    const-string v2, "images/font/glyph_ja-JP_52.png"

    aput-object v2, v0, v1

    const/16 v1, 0x449

    const-string v2, "images/font/glyph_zh-TW_9C.png"

    aput-object v2, v0, v1

    const/16 v1, 0x44a

    const-string v2, "images/font/glyph_92.png"

    aput-object v2, v0, v1

    const/16 v1, 0x44b

    const-string v2, "images/font/glyph_ja-JP_6A.png"

    aput-object v2, v0, v1

    const/16 v1, 0x44c

    const-string v2, "images/font/glyph_D3.png"

    aput-object v2, v0, v1

    const/16 v1, 0x44d

    const-string v2, "images/font/glyph_zh-TW_40.png"

    aput-object v2, v0, v1

    const/16 v1, 0x44e

    const-string v2, "images/font/glyph_zh-TW_4C.png"

    aput-object v2, v0, v1

    const/16 v1, 0x44f

    const-string v2, "images/font/glyph_ja-JP_96.png"

    aput-object v2, v0, v1

    const/16 v1, 0x450

    const-string v2, "images/font/glyph_FB.png"

    aput-object v2, v0, v1

    const/16 v1, 0x451

    const-string v2, "images/font/glyph_D5.png"

    aput-object v2, v0, v1

    const/16 v1, 0x452

    const-string v2, "images/font/glyph_zh-TW_55.png"

    aput-object v2, v0, v1

    const/16 v1, 0x453

    const-string v2, "images/font/glyph_31.png"

    aput-object v2, v0, v1

    const/16 v1, 0x454

    const-string v2, "images/font/glyph_zh-TW_3D.png"

    aput-object v2, v0, v1

    const/16 v1, 0x455

    const-string v2, "images/font/glyph_99.png"

    aput-object v2, v0, v1

    const/16 v1, 0x456

    const-string v2, "images/font/glyph_5E.png"

    aput-object v2, v0, v1

    const/16 v1, 0x457

    const-string v2, "images/font/glyph_ja-JP_58.png"

    aput-object v2, v0, v1

    const/16 v1, 0x458

    const-string v2, "images/font/glyph_ja-JP_9C.png"

    aput-object v2, v0, v1

    const/16 v1, 0x459

    const-string v2, "images/font/glyph_8A.png"

    aput-object v2, v0, v1

    const/16 v1, 0x45a

    const-string v2, "images/font/glyph_ja-JP_87.png"

    aput-object v2, v0, v1

    const/16 v1, 0x45b

    const-string v2, "images/font/glyph_zh-TW_66.png"

    aput-object v2, v0, v1

    const/16 v1, 0x45c

    const-string v2, "images/font/glyph_ja-JP_65.png"

    aput-object v2, v0, v1

    const/16 v1, 0x45d

    const-string v2, "images/font/glyph_zh-TW_63.png"

    aput-object v2, v0, v1

    const/16 v1, 0x45e

    const-string v2, "images/font/glyph_ja-JP_67.png"

    aput-object v2, v0, v1

    const/16 v1, 0x45f

    const-string v2, "images/font/glyph_56.png"

    aput-object v2, v0, v1

    const/16 v1, 0x460

    const-string v2, "images/font/glyph_C9.png"

    aput-object v2, v0, v1

    const/16 v1, 0x461

    const-string v2, "images/font/glyph_ja-JP_39.png"

    aput-object v2, v0, v1

    const/16 v1, 0x462

    const-string v2, "images/font/glyph_ja-JP_77.png"

    aput-object v2, v0, v1

    const/16 v1, 0x463

    const-string v2, "images/font/glyph_zh-TW_3F.png"

    aput-object v2, v0, v1

    const/16 v1, 0x464

    const-string v2, "images/font/glyph_24.png"

    aput-object v2, v0, v1

    const/16 v1, 0x465

    const-string v2, "images/font/glyph_zh-TW_78.png"

    aput-object v2, v0, v1

    const/16 v1, 0x466

    const-string v2, "images/font/glyph_zh-TW_79.png"

    aput-object v2, v0, v1

    const/16 v1, 0x467

    const-string v2, "images/font/glyph_zh-TW_4A.png"

    aput-object v2, v0, v1

    const/16 v1, 0x468

    const-string v2, "images/font/glyph_ja-JP_5A.png"

    aput-object v2, v0, v1

    const/16 v1, 0x469

    const-string v2, "images/font/glyph_79.png"

    aput-object v2, v0, v1

    const/16 v1, 0x46a

    const-string v2, "images/font/glyph_82.png"

    aput-object v2, v0, v1

    const/16 v1, 0x46b

    const-string v2, "images/font/glyph_1F.png"

    aput-object v2, v0, v1

    const/16 v1, 0x46c

    const-string v2, "images/font/glyph_AC.png"

    aput-object v2, v0, v1

    const/16 v1, 0x46d

    const-string v2, "images/font/glyph_0D.png"

    aput-object v2, v0, v1

    const/16 v1, 0x46e

    const-string v2, "images/font/glyph_ja-JP_45.png"

    aput-object v2, v0, v1

    const/16 v1, 0x46f

    const-string v2, "images/font/glyph_ja-JP_8E.png"

    aput-object v2, v0, v1

    const/16 v1, 0x470

    const-string v2, "images/font/default8.png"

    aput-object v2, v0, v1

    const/16 v1, 0x471

    const-string v2, "images/font/glyph_zh-TW_95.png"

    aput-object v2, v0, v1

    const/16 v1, 0x472

    const-string v2, "images/font/glyph_55.png"

    aput-object v2, v0, v1

    const/16 v1, 0x473

    const-string v2, "images/font/glyph_ja-JP_2E.png"

    aput-object v2, v0, v1

    const/16 v1, 0x474

    const-string v2, "images/font/glyph_CA.png"

    aput-object v2, v0, v1

    const/16 v1, 0x475

    const-string v2, "images/font/glyph_ja-JP_42.png"

    aput-object v2, v0, v1

    const/16 v1, 0x476

    const-string v2, "images/font/glyph_67.png"

    aput-object v2, v0, v1

    const/16 v1, 0x477

    const-string v2, "images/font/glyph_ja-JP_88.png"

    aput-object v2, v0, v1

    const/16 v1, 0x478

    const-string v2, "images/font/glyph_ja-JP_81.png"

    aput-object v2, v0, v1

    const/16 v1, 0x479

    const-string v2, "images/font/glyph_28.png"

    aput-object v2, v0, v1

    const/16 v1, 0x47a

    const-string v2, "images/font/glyph_0E.png"

    aput-object v2, v0, v1

    const/16 v1, 0x47b

    const-string v2, "images/font/glyph_ja-JP_34.png"

    aput-object v2, v0, v1

    const/16 v1, 0x47c

    const-string v2, "images/font/glyph_zh-TW_8D.png"

    aput-object v2, v0, v1

    const/16 v1, 0x47d

    const-string v2, "images/font/glyph_05.png"

    aput-object v2, v0, v1

    const/16 v1, 0x47e

    const-string v2, "images/font/glyph_04.png"

    aput-object v2, v0, v1

    const/16 v1, 0x47f

    const-string v2, "images/font/glyph_zh-TW_50.png"

    aput-object v2, v0, v1

    const/16 v1, 0x480

    const-string v2, "images/background.images"

    aput-object v2, v0, v1

    const/16 v1, 0x481

    const-string v2, "images/items.meta"

    aput-object v2, v0, v1

    const/16 v1, 0x482

    const-string v2, "images/misc/pumpkinblur.png"

    aput-object v2, v0, v1

    const/16 v1, 0x483

    const-string v2, "images/misc/enchanted_item_glint.png"

    aput-object v2, v0, v1

    const/16 v1, 0x484

    const-string v2, "images/gui/title.png"

    aput-object v2, v0, v1

    const/16 v1, 0x485

    const-string v2, "images/gui/amazon/boston_buttons.png"

    aput-object v2, v0, v1

    const/16 v1, 0x486

    const-string v2, "images/gui/background/panorama_4.png"

    aput-object v2, v0, v1

    const/16 v1, 0x487

    const-string v2, "images/gui/background/panorama_3.png"

    aput-object v2, v0, v1

    const/16 v1, 0x488

    const-string v2, "images/gui/background/panorama_0.png"

    aput-object v2, v0, v1

    const/16 v1, 0x489

    const-string v2, "images/gui/background/panorama_1.png"

    aput-object v2, v0, v1

    const/16 v1, 0x48a

    const-string v2, "images/gui/background/panorama_2.png"

    aput-object v2, v0, v1

    const/16 v1, 0x48b

    const-string v2, "images/gui/background/panorama_5.png"

    aput-object v2, v0, v1

    const/16 v1, 0x48c

    const-string v2, "images/gui/icons.png"

    aput-object v2, v0, v1

    const/16 v1, 0x48d

    const-string v2, "images/gui/touchgui2.png"

    aput-object v2, v0, v1

    const/16 v1, 0x48e

    const-string v2, "images/gui/spritesheet2.png"

    aput-object v2, v0, v1

    const/16 v1, 0x48f

    const-string v2, "images/gui/titleOriginal.png"

    aput-object v2, v0, v1

    const/16 v1, 0x490

    const-string v2, "images/gui/newgui/Friends.png"

    aput-object v2, v0, v1

    const/16 v1, 0x491

    const-string v2, "images/gui/newgui/WorldDemoScreen.png"

    aput-object v2, v0, v1

    const/16 v1, 0x492

    const-string v2, "images/gui/newgui/anvil-plus.png"

    aput-object v2, v0, v1

    const/16 v1, 0x493

    const-string v2, "images/gui/newgui/RightTabFront.png"

    aput-object v2, v0, v1

    const/16 v1, 0x494

    const-string v2, "images/gui/newgui/XPress.png"

    aput-object v2, v0, v1

    const/16 v1, 0x495

    const-string v2, "images/gui/newgui/scrollbarBG.png"

    aput-object v2, v0, v1

    const/16 v1, 0x496

    const-string v2, "images/gui/newgui/newTouchScrollBox.png"

    aput-object v2, v0, v1

    const/16 v1, 0x497

    const-string v2, "images/gui/newgui/anvil-crossout.png"

    aput-object v2, v0, v1

    const/16 v1, 0x498

    const-string v2, "images/gui/newgui/focusBorder.png"

    aput-object v2, v0, v1

    const/16 v1, 0x499

    const-string v2, "images/gui/newgui/TopBar.png"

    aput-object v2, v0, v1

    const/16 v1, 0x49a

    const-string v2, "images/gui/newgui/Realms.png"

    aput-object v2, v0, v1

    const/16 v1, 0x49b

    const-string v2, "images/gui/newgui/Language18.png"

    aput-object v2, v0, v1

    const/16 v1, 0x49c

    const-string v2, "images/gui/newgui/ScrollBox.png"

    aput-object v2, v0, v1

    const/16 v1, 0x49d

    const-string v2, "images/gui/newgui/World.png"

    aput-object v2, v0, v1

    const/16 v1, 0x49e

    const-string v2, "images/gui/newgui/empty_armor_slot_boots.png"

    aput-object v2, v0, v1

    const/16 v1, 0x49f

    const-string v2, "images/gui/newgui/touchScrollBox.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4a0

    const-string v2, "images/gui/newgui/XHover.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4a1

    const-string v2, "images/gui/newgui/buttonNew.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4a2

    const-string v2, "images/gui/newgui/NormalButtonNoStroke.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4a3

    const-string v2, "images/gui/newgui/arrowLeft.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4a4

    const-string v2, "images/gui/newgui/border.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4a5

    const-string v2, "images/gui/newgui/FriendsDiversity.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4a6

    const-string v2, "images/gui/newgui/empty_armor_slot_leggings.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4a7

    const-string v2, "images/gui/newgui/Wrenches2.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4a8

    const-string v2, "images/gui/newgui/check2.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4a9

    const-string v2, "images/gui/newgui/DarkButtonNoStroke.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4aa

    const-string v2, "images/gui/newgui/TabFront.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4ab

    const-string v2, "images/gui/newgui/TabFrontInGame.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4ac

    const-string v2, "images/gui/newgui/Black.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4ad

    const-string v2, "images/gui/newgui/X.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4ae

    const-string v2, "images/gui/newgui/TabFrontInGameLeftMost.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4af

    const-string v2, "images/gui/newgui/Language16.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4b0

    const-string v2, "images/gui/newgui/classic-button.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4b1

    const-string v2, "images/gui/newgui/TabBackInGameLeftMost.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4b2

    const-string v2, "images/gui/newgui/Dot2.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4b3

    const-string v2, "images/gui/newgui/arrow_large.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4b4

    const-string v2, "images/gui/newgui/Feedback.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4b5

    const-string v2, "images/gui/newgui/Local.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4b6

    const-string v2, "images/gui/newgui/check1.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4b7

    const-string v2, "images/gui/newgui/NormalButtonStroke.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4b8

    const-string v2, "images/gui/newgui/empty_armor_slot_helmet.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4b9

    const-string v2, "images/gui/newgui/NormalButtonThin.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4ba

    const-string v2, "images/gui/newgui/arrow.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4bb

    const-string v2, "images/gui/newgui/Wrenches1.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4bc

    const-string v2, "images/gui/newgui/LeftTabFront.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4bd

    const-string v2, "images/gui/newgui/DarkButtonThin.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4be

    const-string v2, "images/gui/newgui/play_screen"

    aput-object v2, v0, v1

    const/16 v1, 0x4bf

    const-string v2, "images/gui/newgui/play_screen/HoverButtonThinNewBevel2.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4c0

    const-string v2, "images/gui/newgui/play_screen/Indent2.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4c1

    const-string v2, "images/gui/newgui/play_screen/RightTabFront.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4c2

    const-string v2, "images/gui/newgui/play_screen/HoverButtonThinNewBevel.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4c3

    const-string v2, "images/gui/newgui/play_screen/TabFront.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4c4

    const-string v2, "images/gui/newgui/play_screen/HoverButtonThinNewBevel4.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4c5

    const-string v2, "images/gui/newgui/play_screen/NormalButtonStroke.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4c6

    const-string v2, "images/gui/newgui/play_screen/LeftTabFront.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4c7

    const-string v2, "images/gui/newgui/play_screen/HoverButtonThinStroke.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4c8

    const-string v2, "images/gui/newgui/play_screen/MiddleTabFront.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4c9

    const-string v2, "images/gui/newgui/play_screen/TabBackDarker.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4ca

    const-string v2, "images/gui/newgui/play_screen/HoverButtonThinNewBevel3.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4cb

    const-string v2, "images/gui/newgui/play_screen/NormalButtonThinNewBevel.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4cc

    const-string v2, "images/gui/newgui/play_screen/DarkButtonThinStroke1.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4cd

    const-string v2, "images/gui/newgui/play_screen/PressedButtonThinStroke.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4ce

    const-string v2, "images/gui/newgui/anvil-hammer.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4cf

    const-string v2, "images/gui/newgui/ScrollGutter.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4d0

    const-string v2, "images/gui/newgui/TabBackInGame.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4d1

    const-string v2, "images/gui/newgui/anvil-arrow.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4d2

    const-string v2, "images/gui/newgui/empty_armor_slot_chestplate.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4d3

    const-string v2, "images/gui/newgui/X3_ThisOneMostLikely.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4d4

    const-string v2, "images/gui/newgui/DarkButtonStroke.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4d5

    const-string v2, "images/gui/newgui/TabBack.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4d6

    const-string v2, "images/gui/newgui/dialog-background.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4d7

    const-string v2, "images/gui/newgui/Indent.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4d8

    const-string v2, "images/gui/newgui/arrowRight.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4d9

    const-string v2, "images/gui/newgui/classic-button-hover.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4da

    const-string v2, "images/gui/newgui/MiddleTabFront.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4db

    const-string v2, "images/gui/newgui/walking.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4dc

    const-string v2, "images/gui/newgui/classic-button-pressed.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4dd

    const-string v2, "images/gui/newgui/NormalButtonThinStroke.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4de

    const-string v2, "images/gui/newgui/Dot1.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4df

    const-string v2, "images/gui/newgui/xbox4.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4e0

    const-string v2, "images/gui/newgui/Dot3.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4e1

    const-string v2, "images/gui/background.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4e2

    const-string v2, "images/gui/cursor.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4e3

    const-string v2, "images/gui/titleEdu.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4e4

    const-string v2, "images/gui/bg32.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4e5

    const-string v2, "images/gui/touchgui.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4e6

    const-string v2, "images/gui/gui.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4e7

    const-string v2, "images/gui/default_world.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4e8

    const-string v2, "images/gui/spritesheet.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4e9

    const-string v2, "images/gui/gui2.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4ea

    const-string v2, "images/gui/enchanting_table.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4eb

    const-string v2, "images/gui/purpleBorder.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4ec

    const-string v2, "images/gui/spritesheet_removeme.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4ed

    const-string v2, "images/compass.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4ee

    const-string v2, "images/items-opaque.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4ef

    const-string v2, "images/watch-atlas.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4f0

    const-string v2, "images/terrain.meta"

    aput-object v2, v0, v1

    const/16 v1, 0x4f1

    const-string v2, "images/armor/leather_2.tga"

    aput-object v2, v0, v1

    const/16 v1, 0x4f2

    const-string v2, "images/armor/iron_2.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4f3

    const-string v2, "images/armor/diamond_1.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4f4

    const-string v2, "images/armor/gold_1.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4f5

    const-string v2, "images/armor/diamond_2.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4f6

    const-string v2, "images/armor/iron_1.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4f7

    const-string v2, "images/armor/leather_1.tga"

    aput-object v2, v0, v1

    const/16 v1, 0x4f8

    const-string v2, "images/armor/chain_1.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4f9

    const-string v2, "images/armor/chain_2.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4fa

    const-string v2, "images/armor/cloth_2.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4fb

    const-string v2, "images/armor/cloth_1.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4fc

    const-string v2, "images/armor/gold_2.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4fd

    const-string v2, "images/terrain-atlas.tga"

    aput-object v2, v0, v1

    const/16 v1, 0x4fe

    const-string v2, "images/map/map_background.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4ff

    const-string v2, "images/map/map_icons.png"

    aput-object v2, v0, v1

    const/16 v1, 0x500

    const-string v2, "images/environment/sun.png"

    aput-object v2, v0, v1

    const/16 v1, 0x501

    const-string v2, "images/environment/destroy_stage_1.png"

    aput-object v2, v0, v1

    const/16 v1, 0x502

    const-string v2, "images/environment/destroy_stage_8.png"

    aput-object v2, v0, v1

    const/16 v1, 0x503

    const-string v2, "images/environment/destroy_stage_7.png"

    aput-object v2, v0, v1

    const/16 v1, 0x504

    const-string v2, "images/environment/snow.png"

    aput-object v2, v0, v1

    const/16 v1, 0x505

    const-string v2, "images/environment/moon_phases.png"

    aput-object v2, v0, v1

    const/16 v1, 0x506

    const-string v2, "images/environment/destroy_stage_6.png"

    aput-object v2, v0, v1

    const/16 v1, 0x507

    const-string v2, "images/environment/destroy_stage_4.png"

    aput-object v2, v0, v1

    const/16 v1, 0x508

    const-string v2, "images/environment/destroy_stage_2.png"

    aput-object v2, v0, v1

    const/16 v1, 0x509

    const-string v2, "images/environment/destroy_stage_9.png"

    aput-object v2, v0, v1

    const/16 v1, 0x50a

    const-string v2, "images/environment/rain.png"

    aput-object v2, v0, v1

    const/16 v1, 0x50b

    const-string v2, "images/environment/weather.png"

    aput-object v2, v0, v1

    const/16 v1, 0x50c

    const-string v2, "images/environment/clouds.png"

    aput-object v2, v0, v1

    const/16 v1, 0x50d

    const-string v2, "images/environment/destroy_stage_3.png"

    aput-object v2, v0, v1

    const/16 v1, 0x50e

    const-string v2, "images/environment/destroy_stage_0.png"

    aput-object v2, v0, v1

    const/16 v1, 0x50f

    const-string v2, "images/environment/destroy_stage_5.png"

    aput-object v2, v0, v1

    const/16 v1, 0x510

    const-string v2, "images/terrain-atlas_mip0.tga"

    aput-object v2, v0, v1

    const/16 v1, 0x511

    const-string v2, "images/art/kz.png"

    aput-object v2, v0, v1

    const/16 v1, 0x512

    const-string v2, "images/terrain-atlas_mip1.tga"

    aput-object v2, v0, v1

    const/16 v1, 0x513

    const-string v2, "images/portal.png"

    aput-object v2, v0, v1

    const/16 v1, 0x514

    const-string v2, "images/items-opaque.tga"

    aput-object v2, v0, v1

    const/16 v1, 0x515

    const-string v2, "images/fire_atlas.png"

    aput-object v2, v0, v1

    const/16 v1, 0x516

    const-string v2, "images/startup.images"

    aput-object v2, v0, v1

    const/16 v1, 0x517

    const-string v2, "images/terrain-atlas_mip3.tga"

    aput-object v2, v0, v1

    const/16 v1, 0x518

    const-string v2, "images/particles.png"

    aput-object v2, v0, v1

    const/16 v1, 0x519

    const-string v2, "loc/es_ES-pocket.lang"

    aput-object v2, v0, v1

    const/16 v1, 0x51a

    const-string v2, "loc/fr_FR-pocket.lang"

    aput-object v2, v0, v1

    const/16 v1, 0x51b

    const-string v2, "loc/de_DE-pocket.lang"

    aput-object v2, v0, v1

    const/16 v1, 0x51c

    const-string v2, "loc/en_US-pocket.lang"

    aput-object v2, v0, v1

    const/16 v1, 0x51d

    const-string v2, "loc/ja_JP-pocket.lang"

    aput-object v2, v0, v1

    const/16 v1, 0x51e

    const-string v2, "loc/ko_KR-pocket.lang"

    aput-object v2, v0, v1

    const/16 v1, 0x51f

    const-string v2, "loc/zh_TW-pocket.lang"

    aput-object v2, v0, v1

    const/16 v1, 0x520

    const-string v2, "loc/it_IT-pocket.lang"

    aput-object v2, v0, v1

    const/16 v1, 0x521

    const-string v2, "loc/zh_CN-pocket.lang"

    aput-object v2, v0, v1

    const/16 v1, 0x522

    const-string v2, "loc/pt_PT-pocket.lang"

    aput-object v2, v0, v1

    const/16 v1, 0x523

    const-string v2, "loc/fr_CA-pocket.lang"

    aput-object v2, v0, v1

    const/16 v1, 0x524

    const-string v2, "loc/pc-base/de_DE.lang"

    aput-object v2, v0, v1

    const/16 v1, 0x525

    const-string v2, "loc/pc-base/ko_KR.lang"

    aput-object v2, v0, v1

    const/16 v1, 0x526

    const-string v2, "loc/pc-base/ja_JP.lang"

    aput-object v2, v0, v1

    const/16 v1, 0x527

    const-string v2, "loc/pc-base/es_ES.lang"

    aput-object v2, v0, v1

    const/16 v1, 0x528

    const-string v2, "loc/pc-base/fr_CA.lang"

    aput-object v2, v0, v1

    const/16 v1, 0x529

    const-string v2, "loc/pc-base/zh_CN.lang"

    aput-object v2, v0, v1

    const/16 v1, 0x52a

    const-string v2, "loc/pc-base/en_US.lang"

    aput-object v2, v0, v1

    const/16 v1, 0x52b

    const-string v2, "loc/pc-base/latin_america"

    aput-object v2, v0, v1

    const/16 v1, 0x52c

    const-string v2, "loc/pc-base/latin_america/es_AR.lang"

    aput-object v2, v0, v1

    const/16 v1, 0x52d

    const-string v2, "loc/pc-base/latin_america/es_UY.lang"

    aput-object v2, v0, v1

    const/16 v1, 0x52e

    const-string v2, "loc/pc-base/latin_america/es_VE.lang"

    aput-object v2, v0, v1

    const/16 v1, 0x52f

    const-string v2, "loc/pc-base/pt_BR.lang"

    aput-object v2, v0, v1

    const/16 v1, 0x530

    const-string v2, "loc/pc-base/pt_PT.lang"

    aput-object v2, v0, v1

    const/16 v1, 0x531

    const-string v2, "loc/pc-base/es_419.lang"

    aput-object v2, v0, v1

    const/16 v1, 0x532

    const-string v2, "loc/pc-base/zh_TW.lang"

    aput-object v2, v0, v1

    const/16 v1, 0x533

    const-string v2, "loc/pc-base/fr_FR.lang"

    aput-object v2, v0, v1

    const/16 v1, 0x534

    const-string v2, "loc/pc-base/it_IT.lang"

    aput-object v2, v0, v1

    const/16 v1, 0x535

    const-string v2, "loc/pc-base/ru_RU.lang"

    aput-object v2, v0, v1

    const/16 v1, 0x536

    const-string v2, "loc/ru_RU-pocket.lang"

    aput-object v2, v0, v1

    const/16 v1, 0x537

    const-string v2, "loc/pt_BR-pocket.lang"

    aput-object v2, v0, v1

    const/16 v1, 0x538

    const-string v2, "loc/es_MX-pocket.lang"

    aput-object v2, v0, v1

    const/16 v1, 0x539

    const-string v2, "loc/languages.json"

    aput-object v2, v0, v1

    iput-object v0, p0, Lio/mrarm/mcpelauncher/ErrorActivity;->requiredFiles:[Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lio/mrarm/mcpelauncher/ErrorActivity;)Ljava/lang/Class;
    .locals 1
    .param p0, "x0"    # Lio/mrarm/mcpelauncher/ErrorActivity;

    .prologue
    .line 36
    iget-object v0, p0, Lio/mrarm/mcpelauncher/ErrorActivity;->returnClass:Ljava/lang/Class;

    return-object v0
.end method

.method static synthetic access$100(Lio/mrarm/mcpelauncher/ErrorActivity;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lio/mrarm/mcpelauncher/ErrorActivity;

    .prologue
    .line 36
    iget-object v0, p0, Lio/mrarm/mcpelauncher/ErrorActivity;->skippable:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lio/mrarm/mcpelauncher/ErrorActivity;)V
    .locals 0
    .param p0, "x0"    # Lio/mrarm/mcpelauncher/ErrorActivity;

    .prologue
    .line 36
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/ErrorActivity;->requestPermissionOrContinue()V

    return-void
.end method

.method private checkForPermissionAndContinue()Z
    .locals 2

    .prologue
    .line 223
    iget-object v1, p0, Lio/mrarm/mcpelauncher/ErrorActivity;->requestedPermission:Ljava/lang/String;

    invoke-static {p0, v1}, Landroid/support/v4/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_1

    .line 225
    iget-object v1, p0, Lio/mrarm/mcpelauncher/ErrorActivity;->returnClass:Ljava/lang/Class;

    if-eqz v1, :cond_0

    .line 226
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lio/mrarm/mcpelauncher/ErrorActivity;->returnClass:Ljava/lang/Class;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 227
    .local v0, "i":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lio/mrarm/mcpelauncher/ErrorActivity;->startActivity(Landroid/content/Intent;)V

    .line 229
    .end local v0    # "i":Landroid/content/Intent;
    :cond_0
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/ErrorActivity;->finish()V

    .line 230
    const/4 v1, 0x1

    .line 232
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private requestPermissionOrContinue()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 213
    iget-object v0, p0, Lio/mrarm/mcpelauncher/ErrorActivity;->requestedPermission:Ljava/lang/String;

    invoke-static {p0, v0}, Landroid/support/v4/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_0

    .line 215
    new-array v0, v3, [Ljava/lang/String;

    const/4 v1, 0x0

    iget-object v2, p0, Lio/mrarm/mcpelauncher/ErrorActivity;->requestedPermission:Ljava/lang/String;

    aput-object v2, v0, v1

    invoke-static {p0, v0, v3}, Landroid/support/v4/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    .line 220
    :goto_0
    return-void

    .line 218
    :cond_0
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/ErrorActivity;->checkForPermissionAndContinue()Z

    goto :goto_0
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 13
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 1600
    const/16 v2, 0x99

    if-ne p1, v2, :cond_4

    .line 1601
    if-eqz p3, :cond_0

    invoke-virtual/range {p3 .. p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    if-nez v2, :cond_1

    .line 1639
    :cond_0
    :goto_0
    return-void

    .line 1603
    :cond_1
    new-instance v7, Ljava/io/File;

    invoke-virtual/range {p3 .. p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v7, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1605
    .local v7, "file":Ljava/io/File;
    :try_start_0
    new-instance v12, Lio/mrarm/mcpelauncher/ZipAssets;

    new-instance v2, Ljava/util/zip/ZipFile;

    invoke-direct {v2, v7}, Ljava/util/zip/ZipFile;-><init>(Ljava/io/File;)V

    const-string v3, "assets/"

    invoke-direct {v12, v2, v3}, Lio/mrarm/mcpelauncher/ZipAssets;-><init>(Ljava/util/zip/ZipFile;Ljava/lang/String;)V

    .line 1606
    .local v12, "tp":Lio/mrarm/mcpelauncher/ZipAssets;
    iget-object v3, p0, Lio/mrarm/mcpelauncher/ErrorActivity;->requiredFiles:[Ljava/lang/String;

    array-length v4, v3

    const/4 v2, 0x0

    :goto_1
    if-ge v2, v4, :cond_2

    aget-object v5, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1610
    :cond_2
    invoke-virtual {v12}, Lio/mrarm/mcpelauncher/ZipAssets;->close()V

    .line 1611
    new-instance v9, Ljava/io/FileInputStream;

    invoke-direct {v9, v7}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 1612
    .local v9, "inStream":Ljava/io/FileInputStream;
    new-instance v11, Ljava/io/FileOutputStream;

    new-instance v2, Ljava/io/File;

    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lio/mrarm/mcpelauncher/ErrorActivity;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    const-string v4, "minecraftpe.apk"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v11, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 1613
    .local v11, "outStream":Ljava/io/FileOutputStream;
    invoke-virtual {v9}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v1

    .line 1614
    .local v1, "inChannel":Ljava/nio/channels/FileChannel;
    invoke-virtual {v11}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v6

    .line 1615
    .local v6, "outChannel":Ljava/nio/channels/FileChannel;
    const-wide/16 v2, 0x0

    invoke-virtual {v1}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v4

    invoke-virtual/range {v1 .. v6}, Ljava/nio/channels/FileChannel;->transferTo(JJLjava/nio/channels/WritableByteChannel;)J

    .line 1616
    invoke-virtual {v9}, Ljava/io/FileInputStream;->close()V

    .line 1617
    invoke-virtual {v11}, Ljava/io/FileOutputStream;->close()V

    .line 1619
    new-instance v10, Ljava/io/DataOutputStream;

    new-instance v2, Ljava/io/FileOutputStream;

    new-instance v3, Ljava/io/File;

    const/4 v4, 0x0

    invoke-virtual {p0, v4}, Lio/mrarm/mcpelauncher/ErrorActivity;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    const-string v5, "minecraftpe.apk.version"

    invoke-direct {v3, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v2, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v10, v2}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 1620
    .local v10, "out2":Ljava/io/DataOutputStream;
    const/4 v2, -0x1

    invoke-virtual {v10, v2}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 1621
    invoke-virtual {v10}, Ljava/io/DataOutputStream;->close()V

    .line 1623
    iget-object v2, p0, Lio/mrarm/mcpelauncher/ErrorActivity;->returnClass:Ljava/lang/Class;

    if-eqz v2, :cond_3

    .line 1624
    new-instance v8, Landroid/content/Intent;

    iget-object v2, p0, Lio/mrarm/mcpelauncher/ErrorActivity;->returnClass:Ljava/lang/Class;

    invoke-direct {v8, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1625
    .local v8, "i":Landroid/content/Intent;
    invoke-virtual {p0, v8}, Lio/mrarm/mcpelauncher/ErrorActivity;->startActivity(Landroid/content/Intent;)V

    .line 1627
    .end local v8    # "i":Landroid/content/Intent;
    :cond_3
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/ErrorActivity;->finish()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 1638
    .end local v1    # "inChannel":Ljava/nio/channels/FileChannel;
    .end local v6    # "outChannel":Ljava/nio/channels/FileChannel;
    .end local v7    # "file":Ljava/io/File;
    .end local v9    # "inStream":Ljava/io/FileInputStream;
    .end local v10    # "out2":Ljava/io/DataOutputStream;
    .end local v11    # "outStream":Ljava/io/FileOutputStream;
    .end local v12    # "tp":Lio/mrarm/mcpelauncher/ZipAssets;
    :cond_4
    invoke-super/range {p0 .. p3}, Landroid/support/v7/app/AppCompatActivity;->onActivityResult(IILandroid/content/Intent;)V

    goto/16 :goto_0

    .line 1628
    .restart local v7    # "file":Ljava/io/File;
    :catch_0
    move-exception v0

    .line 1629
    .local v0, "e":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 1630
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v3, Lio/mrarm/mcpelauncher/R$string;->assets_invalid_apk:I

    .line 1631
    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 1632
    invoke-virtual {v0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    sget v3, Lio/mrarm/mcpelauncher/R$string;->action_ok:I

    const/4 v4, 0x0

    .line 1633
    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 1634
    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto/16 :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 10
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x0

    .line 48
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 49
    sget v6, Lio/mrarm/mcpelauncher/R$layout;->activity_error:I

    invoke-virtual {p0, v6}, Lio/mrarm/mcpelauncher/ErrorActivity;->setContentView(I)V

    .line 51
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/ErrorActivity;->getIntent()Landroid/content/Intent;

    move-result-object v6

    const-string v7, "error_title"

    invoke-virtual {v6, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 52
    .local v3, "errorString1":Ljava/lang/String;
    if-nez v3, :cond_0

    .line 53
    sget v6, Lio/mrarm/mcpelauncher/R$string;->error_unknown:I

    invoke-virtual {p0, v6}, Lio/mrarm/mcpelauncher/ErrorActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 54
    :cond_0
    sget v6, Lio/mrarm/mcpelauncher/R$id;->errorString1:I

    invoke-virtual {p0, v6}, Lio/mrarm/mcpelauncher/ErrorActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    invoke-virtual {v6, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/ErrorActivity;->getIntent()Landroid/content/Intent;

    move-result-object v6

    const-string v7, "error_desc"

    invoke-virtual {v6, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 57
    .local v4, "errorString2":Ljava/lang/String;
    if-nez v4, :cond_1

    .line 58
    sget v6, Lio/mrarm/mcpelauncher/R$string;->error_unknown_desc:I

    invoke-virtual {p0, v6}, Lio/mrarm/mcpelauncher/ErrorActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 59
    :cond_1
    sget v6, Lio/mrarm/mcpelauncher/R$id;->errorString2:I

    invoke-virtual {p0, v6}, Lio/mrarm/mcpelauncher/ErrorActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    invoke-virtual {v6, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 62
    :try_start_0
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/ErrorActivity;->getIntent()Landroid/content/Intent;

    move-result-object v6

    const-string v7, "return_class"

    invoke-virtual {v6, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    iput-object v6, p0, Lio/mrarm/mcpelauncher/ErrorActivity;->returnClass:Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 66
    :goto_0
    sget v6, Lio/mrarm/mcpelauncher/R$id;->errorAction:I

    invoke-virtual {p0, v6}, Lio/mrarm/mcpelauncher/ErrorActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 68
    .local v1, "btn":Landroid/widget/Button;
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/ErrorActivity;->getIntent()Landroid/content/Intent;

    move-result-object v6

    const-string v7, "action"

    invoke-virtual {v6, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 69
    .local v0, "action":Ljava/lang/String;
    sget v6, Lio/mrarm/mcpelauncher/R$drawable;->ic_arrow_forward_white_24dp:I

    invoke-static {p0, v6}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-virtual {v1, v9, v9, v6, v9}, Landroid/widget/Button;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 70
    const-string v6, "open_store"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 71
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/ErrorActivity;->getIntent()Landroid/content/Intent;

    move-result-object v6

    const-string v7, "package_name"

    invoke-virtual {v6, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 72
    .local v5, "packageName":Ljava/lang/String;
    sget v6, Lio/mrarm/mcpelauncher/R$string;->action_google_play:I

    invoke-virtual {v1, v6}, Landroid/widget/Button;->setText(I)V

    .line 73
    new-instance v6, Lio/mrarm/mcpelauncher/ErrorActivity$1;

    invoke-direct {v6, p0, v5}, Lio/mrarm/mcpelauncher/ErrorActivity$1;-><init>(Lio/mrarm/mcpelauncher/ErrorActivity;Ljava/lang/String;)V

    invoke-virtual {v1, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 210
    .end local v5    # "packageName":Ljava/lang/String;
    :cond_2
    :goto_1
    return-void

    .line 83
    :cond_3
    const-string v6, "continue"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 84
    sget v6, Lio/mrarm/mcpelauncher/R$string;->action_continue:I

    invoke-virtual {v1, v6}, Landroid/widget/Button;->setText(I)V

    .line 85
    new-instance v6, Lio/mrarm/mcpelauncher/ErrorActivity$2;

    invoke-direct {v6, p0}, Lio/mrarm/mcpelauncher/ErrorActivity$2;-><init>(Lio/mrarm/mcpelauncher/ErrorActivity;)V

    invoke-virtual {v1, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_1

    .line 95
    :cond_4
    const-string v6, "request_permission"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 96
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/ErrorActivity;->getIntent()Landroid/content/Intent;

    move-result-object v6

    const-string v7, "permission"

    invoke-virtual {v6, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lio/mrarm/mcpelauncher/ErrorActivity;->requestedPermission:Ljava/lang/String;

    .line 97
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/ErrorActivity;->getIntent()Landroid/content/Intent;

    move-result-object v6

    const-string v7, "permission_name"

    invoke-virtual {v6, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lio/mrarm/mcpelauncher/ErrorActivity;->requestedPermissionName:Ljava/lang/String;

    .line 98
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/ErrorActivity;->getIntent()Landroid/content/Intent;

    move-result-object v6

    const-string v7, "skippable"

    invoke-virtual {v6, v7, v8}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 99
    sget v6, Lio/mrarm/mcpelauncher/R$id;->errorAction2:I

    invoke-virtual {p0, v6}, Lio/mrarm/mcpelauncher/ErrorActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 100
    .local v2, "btn2":Landroid/widget/Button;
    sget v6, Lio/mrarm/mcpelauncher/R$string;->action_skip:I

    invoke-virtual {v2, v6}, Landroid/widget/Button;->setText(I)V

    .line 101
    invoke-virtual {v2, v8}, Landroid/widget/Button;->setVisibility(I)V

    .line 102
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/ErrorActivity;->getIntent()Landroid/content/Intent;

    move-result-object v6

    const-string v7, "skippable_id"

    invoke-virtual {v6, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lio/mrarm/mcpelauncher/ErrorActivity;->skippable:Ljava/lang/String;

    .line 103
    new-instance v6, Lio/mrarm/mcpelauncher/ErrorActivity$3;

    invoke-direct {v6, p0}, Lio/mrarm/mcpelauncher/ErrorActivity$3;-><init>(Lio/mrarm/mcpelauncher/ErrorActivity;)V

    invoke-virtual {v2, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 117
    .end local v2    # "btn2":Landroid/widget/Button;
    :cond_5
    sget v6, Lio/mrarm/mcpelauncher/R$string;->action_ask_again:I

    invoke-virtual {v1, v6}, Landroid/widget/Button;->setText(I)V

    .line 118
    new-instance v6, Lio/mrarm/mcpelauncher/ErrorActivity$4;

    invoke-direct {v6, p0}, Lio/mrarm/mcpelauncher/ErrorActivity$4;-><init>(Lio/mrarm/mcpelauncher/ErrorActivity;)V

    invoke-virtual {v1, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 124
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/ErrorActivity;->requestPermissionOrContinue()V

    goto :goto_1

    .line 125
    :cond_6
    const-string v6, "safe_mode"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 126
    sget v6, Lio/mrarm/mcpelauncher/R$id;->errorAction2:I

    invoke-virtual {p0, v6}, Lio/mrarm/mcpelauncher/ErrorActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 127
    .restart local v2    # "btn2":Landroid/widget/Button;
    sget v6, Lio/mrarm/mcpelauncher/R$string;->action_continue:I

    invoke-virtual {v2, v6}, Landroid/widget/Button;->setText(I)V

    .line 128
    invoke-virtual {v2, v8}, Landroid/widget/Button;->setVisibility(I)V

    .line 129
    new-instance v6, Lio/mrarm/mcpelauncher/ErrorActivity$5;

    invoke-direct {v6, p0}, Lio/mrarm/mcpelauncher/ErrorActivity$5;-><init>(Lio/mrarm/mcpelauncher/ErrorActivity;)V

    invoke-virtual {v2, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 137
    sget v6, Lio/mrarm/mcpelauncher/R$string;->action_safe_mode:I

    invoke-virtual {v1, v6}, Landroid/widget/Button;->setText(I)V

    .line 138
    new-instance v6, Lio/mrarm/mcpelauncher/ErrorActivity$6;

    invoke-direct {v6, p0}, Lio/mrarm/mcpelauncher/ErrorActivity$6;-><init>(Lio/mrarm/mcpelauncher/ErrorActivity;)V

    invoke-virtual {v1, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto/16 :goto_1

    .line 149
    .end local v2    # "btn2":Landroid/widget/Button;
    :cond_7
    const-string v6, "pick_default_assets"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 150
    sget v6, Lio/mrarm/mcpelauncher/R$id;->errorAction2:I

    invoke-virtual {p0, v6}, Lio/mrarm/mcpelauncher/ErrorActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 151
    .restart local v2    # "btn2":Landroid/widget/Button;
    sget v6, Lio/mrarm/mcpelauncher/R$string;->action_load_apk:I

    invoke-virtual {v1, v6}, Landroid/widget/Button;->setText(I)V

    .line 152
    sget v6, Lio/mrarm/mcpelauncher/R$string;->action_extract_with_root:I

    invoke-virtual {v2, v6}, Landroid/widget/Button;->setText(I)V

    .line 153
    invoke-virtual {v2, v8}, Landroid/widget/Button;->setVisibility(I)V

    .line 154
    new-instance v6, Lio/mrarm/mcpelauncher/ErrorActivity$7;

    invoke-direct {v6, p0}, Lio/mrarm/mcpelauncher/ErrorActivity$7;-><init>(Lio/mrarm/mcpelauncher/ErrorActivity;)V

    invoke-virtual {v1, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 160
    new-instance v6, Lio/mrarm/mcpelauncher/ErrorActivity$8;

    invoke-direct {v6, p0}, Lio/mrarm/mcpelauncher/ErrorActivity$8;-><init>(Lio/mrarm/mcpelauncher/ErrorActivity;)V

    invoke-virtual {v2, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto/16 :goto_1

    .line 63
    .end local v0    # "action":Ljava/lang/String;
    .end local v1    # "btn":Landroid/widget/Button;
    .end local v2    # "btn2":Landroid/widget/Button;
    :catch_0
    move-exception v6

    goto/16 :goto_0
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 5
    .param p1, "requestCode"    # I
    .param p2, "permissions"    # [Ljava/lang/String;
    .param p3, "grantResults"    # [I

    .prologue
    const/4 v4, 0x0

    .line 237
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/ErrorActivity;->checkForPermissionAndContinue()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 255
    :cond_0
    :goto_0
    return-void

    .line 239
    :cond_1
    array-length v1, p3

    if-eqz v1, :cond_2

    aget v1, p3, v4

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    :cond_2
    iget-object v1, p0, Lio/mrarm/mcpelauncher/ErrorActivity;->requestedPermission:Ljava/lang/String;

    invoke-static {p0, v1}, Landroid/support/v4/app/ActivityCompat;->shouldShowRequestPermissionRationale(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 240
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 241
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    sget v1, Lio/mrarm/mcpelauncher/R$string;->permission_denied_do_not_ask_again_dialog_title:I

    invoke-virtual {p0, v1}, Lio/mrarm/mcpelauncher/ErrorActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 242
    sget v1, Lio/mrarm/mcpelauncher/R$string;->permission_denied_do_not_ask_again_dialog_text:I

    invoke-virtual {p0, v1}, Lio/mrarm/mcpelauncher/ErrorActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lio/mrarm/mcpelauncher/ErrorActivity;->requestedPermissionName:Ljava/lang/String;

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 243
    const-string v1, "Go to settings"

    new-instance v2, Lio/mrarm/mcpelauncher/ErrorActivity$9;

    invoke-direct {v2, p0}, Lio/mrarm/mcpelauncher/ErrorActivity$9;-><init>(Lio/mrarm/mcpelauncher/ErrorActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 252
    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 253
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0
.end method
