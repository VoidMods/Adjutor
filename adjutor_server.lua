RegisterServerEvent('adjutor:logpos')
AddEventHandler('adjutor:logpos', function(pos)
    file = io.open('location_log.txt', 'a')
    file:write('vector3(' ..  pos.x .. ', '.. pos.y .. ', ' .. pos.z .. '),\n')
    file:close()
end)