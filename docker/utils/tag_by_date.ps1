docker tag kaiaai/kaiaai:humble "$((get-date).toString('kaiaai/kaiaai:\hu\mble-MM-dd-yyyy'))"
docker push "$((get-date).toString('kaiaai/kaiaai:\hu\mble-MM-dd-yyyy'))"
docker tag kaiaai/kaiaai:iron "$((get-date).toString('kaiaai/kaiaai:iron-MM-dd-yyyy'))"
docker push "$((get-date).toString('kaiaai/kaiaai:iron-MM-dd-yyyy'))"
