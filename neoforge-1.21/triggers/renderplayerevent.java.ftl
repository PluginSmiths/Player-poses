<#include "procedures.java.ftl">
@Mod.EventBusSubscriber
public class ${name}Procedure {
    @OnlyIn(Dist.CLIENT)
    @SubscribeEvent
    public static void onEventTriggered(RenderPlayerEvent.Pre event) {
        <#assign dependenciesCode><#compress>
            <@procedureDependenciesCode dependencies, {
            "x": "(Player) event.getPlayer().getX()",
            "y": "(Player) event.getPlayer().getY()",
            "z": "(Player) event.getPlayer().getZ()",
            "entity": "(Player) event.getPlayer()",
            "world": "(Player) event.getPlayer().level()",
            "Arms": "(HumanoidModel) event.getRenderer().getModel()",
            "event": "event"
            }/>
        </#compress></#assign>
        execute(event<#if dependenciesCode?has_content>,</#if>${dependenciesCode});
    }