--机装少女 博丽灵梦
function c88176001.initial_effect(c)
	--spsummon
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(88176001,0))
	e1:SetCategory(CATEGORY_SPECIAL_SUMMON)
	e1:SetType(EFFECT_TYPE_IGNITION)
	e1:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e1:SetRange(LOCATION_HAND+LOCATION_MZONE)
	e1:SetCountLimit(1,88176001)
	e1:SetTarget(c88176001.settg)
	e1:SetOperation(c88176001.setop)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetDescription(aux.Stringid(88176001,1))
	e2:SetCategory(CATEGORY_TOHAND+CATEGORY_SEARCH)
	e2:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
	e2:SetProperty(EFFECT_FLAG_DELAY)
	e2:SetCode(EVENT_SUMMON_SUCCESS)
	e2:SetCountLimit(1,88276001)
	e2:SetTarget(c88176001.thtg)
	e2:SetOperation(c88176001.thop)
	c:RegisterEffect(e2)
	local e3=e2:Clone()
	e3:SetCode(EVENT_SPSUMMON_SUCCESS)
	c:RegisterEffect(e3)
	local e4=Effect.CreateEffect(c)
	e4:SetType(EFFECT_TYPE_XMATERIAL+EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e4:SetCode(EFFECT_DESTROY_REPLACE)
	e4:SetRange(LOCATION_MZONE)
	e4:SetValue(c88176001.desrepval)
	e4:SetTarget(c88176001.desreptg)
	e4:SetOperation(c88176001.desrepop)
	c:RegisterEffect(e4)
end
function c88176001.setfilter(c)
	return c:IsSetCard(0x3592) and c:GetType()==TYPE_SPELL 
end
function c88176001.settg(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	local c=e:GetHandler()
	if chkc then return chkc:IsLocation(LOCATION_GRAVE) and chkc:IsControler(tp) and c88176001.setfilter(chkc) end
	if chk==0 then return Duel.IsExistingTarget(c88176001.setfilter,tp,LOCATION_GRAVE,0,1,nil) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
	local g=Duel.SelectTarget(tp,c88176001.setfilter,tp,LOCATION_GRAVE,0,1,1,nil)
end
function c88176001.setop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local tc=Duel.GetFirstTarget()
	if tc:IsRelateToEffect(e) then
		local e1=Effect.CreateEffect(c)
		e1:SetType(EFFECT_TYPE_FIELD)
		e1:SetCode(EFFECT_ADD_SETCODE)
		if tc:IsCode(88178003) then
			e1:SetValue(0x3591,0x3597)
		elseif tc:IsCode(88178102) then
			e1:SetValue(0x3593,0x594)
		elseif tc:IsCode(88178309) then
			e1:SetValue(0x595,0x596)
		elseif tc:IsCode(88178601) then
			e1:SetValue(0x3598,3599)
		elseif tc:IsCode(88178801) then
			e1:SetValue(0x359a)
		elseif tc:IsCode(88178901) then
			e1:SetValue(0x359b)
		elseif tc:IsCode(88179001) then
			e1:SetValue(0x359c)
		elseif tc:IsCode(88179101) then
			e1:SetValue(0x359d)
		elseif tc:IsCode(88179201) then
			e1:SetValue(0x359e,0x559e)
		elseif tc:IsCode(88179301) then
			e1:SetValue(0x359f,0x559f)
		elseif tc:IsCode(88179401) then
			e1:SetValue(0x35a0)
		elseif tc:IsCode(88179501) then
			e1:SetValue(0x35a1)
		elseif tc:IsCode(88179601) then
			e1:SetValue(0x35a2,0x55a2,0x65a2,0x95a2)
		elseif tc:IsCode(88179701) then
			e1:SetValue(0x35a3,0x55a3)
		end
		e1:SetTargetRange(LOCATION_DECK+LOCATION_HAND+LOCATION_ONFIELD+LOCATION_GRAVE+LOCATION_REMOVED+LOCATION_EXTRA,0)
		e1:SetTarget(c88176001.codefilter)
		Duel.RegisterEffect(e1,tp)
		local e2=Effect.CreateEffect(c)
		e2:SetType(EFFECT_TYPE_FIELD)
		e2:SetCode(EFFECT_ADD_SETCODE)
		if tc:IsCode(88178003) then
			e2:SetValue(0x3597)
		elseif tc:IsCode(88178102) then
			e2:SetValue(0x594)
		elseif tc:IsCode(88178309) then
			e2:SetValue(0x596)
		elseif tc:IsCode(88178601) then
			e2:SetValue(0x3599)
		elseif tc:IsCode(88179201) then
			e2:SetValue(0x559e)
		elseif tc:IsCode(88179301) then
			e2:SetValue(0x559f)
		elseif tc:IsCode(88179601) then
			e2:SetValue(0x55a2)
		elseif tc:IsCode(88179701) then
			e2:SetValue(0x55a3)
		end
		e2:SetTargetRange(LOCATION_DECK+LOCATION_HAND+LOCATION_ONFIELD+LOCATION_GRAVE+LOCATION_REMOVED+LOCATION_EXTRA,0)
		e2:SetTarget(c88176001.codefilter)
		Duel.RegisterEffect(e2,tp)
		local e3=Effect.CreateEffect(c)
		e3:SetType(EFFECT_TYPE_FIELD)
		e3:SetCode(EFFECT_ADD_SETCODE)
		if tc:IsCode(88179601) then
			e3:SetValue(0x65a2)
		end
		e3:SetTargetRange(LOCATION_DECK+LOCATION_HAND+LOCATION_ONFIELD+LOCATION_GRAVE+LOCATION_REMOVED+LOCATION_EXTRA,0)
		e3:SetTarget(c88176001.codefilter)
		Duel.RegisterEffect(e3,tp)
		local e4=Effect.CreateEffect(c)
		e4:SetType(EFFECT_TYPE_FIELD)
		e4:SetCode(EFFECT_ADD_SETCODE)
		if tc:IsCode(88179601) then
			e4:SetValue(0x95a2)
		end
		e4:SetTargetRange(LOCATION_DECK+LOCATION_HAND+LOCATION_ONFIELD+LOCATION_GRAVE+LOCATION_REMOVED+LOCATION_EXTRA,0)
		e4:SetTarget(c88176001.codefilter)
		Duel.RegisterEffect(e4,tp)
	end
end
function c88176001.codefilter(e,c)
	return c:IsCode(88176001)
end
function c88176001.thfilter(c)
	return c:IsSetCard(0x9592) and not c:IsCode(88176001) and c:IsType(TYPE_MONSTER) and c:IsAbleToHand()
end
function c88176001.thtg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(c88176001.thfilter,tp,LOCATION_DECK,0,1,nil) end
	Duel.SetOperationInfo(0,CATEGORY_TOHAND,nil,1,tp,LOCATION_DECK)
end
function c88176001.thop(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_ATOHAND)
	local g=Duel.SelectMatchingCard(tp,c88176001.thfilter,tp,LOCATION_DECK,0,1,1,nil)
	if g:GetCount()>0 then
		Duel.SendtoHand(g,nil,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,g)
	end
end
function c88176001.repfilter(c,e,tp)
	return c:IsControler(tp) and c:IsLocation(LOCATION_ONFIELD) and c==e:GetHandler()
		and c:IsReason(REASON_BATTLE+REASON_EFFECT) and not c:IsReason(REASON_REPLACE)
end
function c88176001.repfilter2(c,e)
	return c:IsDestructable(e) and not c:IsStatus(STATUS_DESTROY_CONFIRMED+STATUS_BATTLE_DESTROYED)
end
function c88176001.desrepval(e,c)
	return c88176001.repfilter(c,e,e:GetHandlerPlayer())
end
function c88176001.desreptg(e,tp,eg,ep,ev,re,r,rp,chk)
	local c=e:GetHandler()
	if chk==0 then return Duel.IsExistingMatchingCard(c88176001.repfilter2,tp,LOCATION_ONFIELD,LOCATION_ONFIELD,1,c,e) end
	if Duel.SelectEffectYesNo(tp,c,96) then
		Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_DESREPLACE)
		local g=Duel.SelectMatchingCard(tp,c88176001.repfilter2,tp,LOCATION_ONFIELD,LOCATION_ONFIELD,1,1,c,e)
		e:SetLabelObject(g:GetFirst())
		g:GetFirst():SetStatus(STATUS_DESTROY_CONFIRMED,true)
		return true
	else return false end
end
function c88176001.desrepop(e,tp,eg,ep,ev,re,r,rp)
	local tc=e:GetLabelObject()
	tc:SetStatus(STATUS_DESTROY_CONFIRMED,false)
	Duel.Destroy(tc,REASON_EFFECT+REASON_REPLACE)
end