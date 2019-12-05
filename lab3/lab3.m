eignface = eignfaces_blk(:,:,3)

length_value = sqrt(sum(sum(eignface.^2)))

eignface_orthonormal = eignface./length_value