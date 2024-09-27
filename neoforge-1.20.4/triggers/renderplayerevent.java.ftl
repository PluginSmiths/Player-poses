<#include "procedures.java.ftl">
@Mod.EventBusSubscriber
public class ${name}Procedure {
    @OnlyIn(Dist.CLIENT)
    @SubscribeEvent
    public static void onEventTriggered(RenderPlayerEvent.Pre event) {
        <#assign dependenciesCode><#compress>
            <@procedureDependenciesCode dependencies, {
            "x": "(Player) event.getEntityPlayer().getX()",
            "y": "(Player) event.getEntityPlayer().getY()",
            "z": "(Player) event.getEntityPlayer().getZ()",
            "entity": "(Player) event.getEntityPlayer()",
            "world": "(Player) event.getEntityPlayer().level()",
            "Model": "(HumanoidModel) event.getRenderer().getModel()",
            "PartialRenderTick": "event.getPartialRenderTick()",
            "event": "event"
            }/>
        </#compress></#assign>
        execute(event<#if dependenciesCode?has_content>,</#if>${dependenciesCode});
    }