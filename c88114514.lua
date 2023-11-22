--伊比利亚皇家近卫·威斯邦
if not pcall(function() require("expansions/script/c51500000") end) then require("script/c51500000") end
local cm,m=GetID()
cm.CODE_IBRA=true
function cm.initial_effect(c)
	--xyz summon
	aux.AddXyzProcedure(c,nil,4,2)
	c:EnableReviveLimit()
	--atkchange and Destroy or remove
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(m,0))
	e1:SetCategory(CATEGORY_ATKCHANGE)
	e1:SetType(EFFECT_TYPE_IGNITION)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCountLimit(1,m)
	e1:SetTarget(cm.autg)
	e1:SetOperation(cm.auop)
	c:RegisterEffect(e1)
	--equip
	local e2=Effect.CreateEffect(c)
	e2:SetDescription(aux.Stringid(m,1))
	e2:SetCategory(CATEGORY_ATKCHANGE)
	e2:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
	e2:SetProperty(EFFECT_FLAG_DELAY)
	e2:SetCode(EVENT_MOVE)
	e2:SetCountLimit(1,m+100)
	e2:SetCondition(cm.atkcon)
	e2:SetTarget(cm.atktg)
	e2:SetOperation(cm.atkop)
	c:RegisterEffect(e2)
end
--ef1
function cm.aufilter(c)
	return Chkcode.IBRA(c) and c:IsType(TYPE_MONSTER) and c:IsFaceup()
end
function cm.dorfilter(c)
	return c:IsType(TYPE_SPELL+TYPE_TRAP)
end
function cm.autg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(cm.aufilter,tp,LOCATION_MZONE,0,1,nil) and Duel.IsExistingMatchingCard(cm.dorfilter,tp,0,LOCATION_SZONE,1,nil) end
	local opt=Duel.SelectOption(tp,aux.Stringid(m,2),aux.Stringid(m,3))
	e:SetLabel(opt)
	e:GetHandler():RemoveOverlayCard(tp,opt+1,opt+1,REASON_COST)
	if opt==0 then
		Duel.SetOperationInfo(0,CATEGORY_DESTROY,nil,1,tp,LOCATION_SZONE)
	else
		Duel.SetOperationInfo(0,CATEGORY_REMOVE,nil,1,tp,LOCATION_SZONE)
	end
end
function cm.auop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if e:GetLabel()==0 then
		Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SELF)
		local tc=Duel.SelectMatchingCard(tp,cm.aufilter,tp,LOCATION_MZONE,0,1,1,nil):GetFirst()
		local e1=Effect.CreateEffect(c)
		e1:SetType(EFFECT_TYPE_SINGLE)
		e1:SetCode(EFFECT_UPDATE_ATTACK)
		e1:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
		e1:SetReset(RESET_EVENT+RESETS_STANDARD)
		e1:SetValue(400)
		tc:RegisterEffect(e1)
		Duel.BreakEffect()
		Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_DESTROY)
		local g=Duel.SelectMatchingCard(tp,cm.dorfilter,tp,0,LOCATION_SZONE,1,1,nil)
		if #g>0 then
			Duel.Destroy(g,REASON_EFFECT)
		end
	else
		local aug=Duel.GetMatchingGroup(cm.aufilter,tp,LOCATION_MZONE,0,nil)
		if #aug>0 then
			for tc in aux.Next(aug) do
				local e1=Effect.CreateEffect(c)
				e1:SetType(EFFECT_TYPE_SINGLE)
				e1:SetCode(EFFECT_UPDATE_ATTACK)
				e1:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
				e1:SetReset(RESET_EVENT+RESETS_STANDARD)
				e1:SetValue(400)
				tc:RegisterEffect(e1)
			end
			Duel.BreakEffect()
			Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_REMOVE)
			local g=Duel.SelectMatchingCard(tp,cm.dorfilter,tp,0,LOCATION_SZONE,1,1,nil)
			if #g>0 then
				Duel.Remove(g,POS_FACEUP,REASON_EFFECT)
			end
		end
	end
end
--ef2
function cm.atkcon(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	return c:IsReason(REASON_COST) and re:IsActivated() and re:IsActiveType(TYPE_XYZ)
		and c:IsPreviousLocation(LOCATION_OVERLAY)
end
function cm.atktg(e,tp,eg,ep,ev,re,r,rp,chk)
	local c=e:GetHandler()
	local aug=Duel.GetMatchingGroup(cm.aufilter,tp,LOCATION_MZONE,0,nil)
	if chk==0 then return #aug>0 end
end
function cm.atkop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local aug=Duel.GetMatchingGroup(cm.aufilter,tp,LOCATION_MZONE,0,nil)
	if #aug>0 then
		for tc in aux.Next(aug) do
			local e1=Effect.CreateEffect(c)
			e1:SetType(EFFECT_TYPE_SINGLE)
			e1:SetCode(EFFECT_UPDATE_ATTACK)
			e1:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
			e1:SetReset(RESET_EVENT+RESETS_STANDARD)
			e1:SetValue(400)
			tc:RegisterEffect(e1)
		end
	end
end